class Search < ApplicationRecord
  def sales
    @sales ||= find_sales
  end

  private

  def find_sales
    sales = Sale.all
    #cliente
    sales = sales.where(client_id: client_id) if client_id.present?

    inner_query_dates = SaleState.select("sale_id, MAX(state_id) AS max_state").group(:sale_id).to_sql
    #fecha

    sales = sales.joins(:sale_states).joins("INNER JOIN (#{inner_query_dates}) AS group_states ON sales.id=group_states.sale_id").where("group_states.sale_id=sales.id AND group_states.max_state=sale_states.state_id AND sale_states.updated_at >= ?", updated_open) if updated_open.present?
    sales = sales.joins(:sale_states).joins("INNER JOIN (#{inner_query_dates}) AS group_states ON sales.id=group_states.sale_id").where("group_states.sale_id=sales.id AND group_states.max_state=sale_states.state_id AND sale_states.updated_at < ?", (updated_close.to_datetime + 1.days).to_s) if updated_close.present?
    #products
    if products.present?
      productos = JSON.parse(products.delete('\\"'))
      puts "TYPE: #{products.class}"
      puts productos
      sales = sales.joins(:sale_products).where("sale_products.product_id IN (?)", productos).group("sales.id").having("count(sale_products.product_id) >= ?", productos.length)
    end
    #estados
    if states.present?
      puts states
      sales = sales.joins(:sale_states).joins("INNER JOIN (#{inner_query_dates}) AS group_states ON sales.id=group_states.sale_id").where("group_states.sale_id=sales.id AND group_states.max_state=sale_states.state_id AND group_states.max_state IN (?)", states)
    end
    #total
    sales = sales.joins({:sale_products => :product}).group("sales.id").having("SUM(sale_products.cantidad*products.unit_price*sale_products.real_weight) >= ?", total_min) if total_min.present?
    sales = sales.joins({:sale_products => :product}).group("sales.id").having("SUM(sale_products.cantidad*products.unit_price*sale_products.real_weight) <= ?", total_max) if total_max.present?
    #Sector
    sales = sales.joins(:client => :direction).where('directions.sector = ?', sector) if sector.present?

    #orden
    if order.present?
      if order == "fecha"
        sales = sales.joins(:sale_states).joins("INNER JOIN (#{inner_query_dates}) AS group_states ON sales.id=group_states.sale_id").where("group_states.sale_id=sales.id AND group_states.max_state=sale_states.state_id ").order("sale_states.updated_at")
      elsif order == "cliente"
        sales = sales.order(:client_id)
      elsif order == "estado"
        sales = sales.joins(:sale_states).joins("INNER JOIN (#{inner_query_dates}) AS group_states ON sales.id=group_states.sale_id").where("group_states.sale_id=sales.id AND group_states.max_state=sale_states.state_id ").order("sale_states.state_id")
      elsif order == "total"
        sales = sales.joins({:sale_products => :product}).group("sales.id").order("SUM(sale_products.cantidad*products.unit_price*sale_products.real_weight)")
      end
    else
      sales = sales.order(:client_id)
    end

    sales.uniq
  end
end
