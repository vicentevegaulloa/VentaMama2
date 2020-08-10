class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy, :next_state]
  def index
    @sales = Sale.search(params[:search])
  end

  def new
    @sale = Sale.new
    @sale.sale_products.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.valid?
      @sale.save
      (1..params[:state].to_i).each do |i|
        @sale.states << State.find(i)
        puts i
      end
      @sale.sale_products.each do |sp|
        if not sp.real_weight
          sp.update(real_weight: sp.product.estimated_weight)
        else
          sp.update(cantidad: 1)
        end
      end
      if @sale.states.maximum(:id) == 1
        @sale.update(paid: 0)
      elsif @sale.states.maximum(:id) == 3
        @sale.update(paid: @sale.total)
      elsif @sale.paid==nil
        @sale.update(paid: 0)
      end
      redirect_to search_path(1)

    else
      redirect_to new_sale_path
    end

  end

  def show
  end

  def edit
    @sale = Sale.find(params[:id])
  end


  def update
    if @sale.update_attributes(sale_params)
      @sale.sale_states.where("sale_states.state_id > ?", params[:state]).delete_all
      (1..params[:state].to_i).each do |i|
        puts "El i es: #{i} #{'-'*20}"
        puts(@sale.states.find_by(id:i))
        if not @sale.states.find_by(id:i)
          @sale.states << State.find(i)
          puts State.find(i)
          puts @sale.states
        end
      end
      @sale.sale_states.find_by(state_id: params[:state]).update(updated_at: Time.now)
      @sale.sale_products.each do |sp|
        if not sp.real_weight
          sp.update(real_weight: sp.product.estimated_weight)
        else
          sp.update(cantidad: 1)
        end
      end
      redirect_to search_path(1)
    else
      redirect_to edit_sale_path(@sale)
    end
  end

  def destroy
    @sale.destroy
    redirect_to search_path(1)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def next_state
    if State.find(@sale.states.maximum(:id) + 1) == 3
      @sale.update(paid: @sale.total)
    end
    @sale.states << State.find(@sale.states.maximum(:id) + 1)
    redirect_to search_path(1)
  end


  def sale_params
    params.require(:sale).permit(
      :client_id,
      :search,
      :state,
      :paid,
      sale_products_attributes:
        [
          :id,
          :cantidad,
          :product_id,
          :real_weight,
          :_destroy
          ])
  end
end
