class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @sale.sale_states.new
    @sale.sale_products.new
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.save
    redirect_to sales_path
  end

  def show
    
  end

  def edit
  end

  def update
    @client.update(client_params)
    redirect_to clients_path
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end


  def sale_params
    params.require(:sale).permit(
      :client_id,
      sale_states_attributes:
        [
          :state_id,
          :_destroy
          ],
      sale_products_attributes:
        [
          :cantidad,
          :product_id,
          :_destroy
          ])
  end
end
