class Client < ApplicationRecord
  has_one :direction, dependent: :destroy
  has_many :sales, dependent: :destroy
  accepts_nested_attributes_for :direction, :allow_destroy => true
  validates :name, presence: true

  def deuda
    inner_query_dates = SaleState.select("sale_id, MAX(state_id) AS max_state").group(:sale_id).to_sql
    deuda = self.sales.joins(:sale_states).joins("INNER JOIN (#{inner_query_dates}) AS group_states ON sales.id=group_states.sale_id").joins(:sale_products => :product).where("group_states.sale_id=sales.id AND group_states.max_state=sale_states.state_id AND group_states.max_state=2").sum("sale_products.cantidad*products.unit_price")
    deuda
  end
end
