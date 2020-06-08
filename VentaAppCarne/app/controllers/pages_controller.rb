class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def home
  end

  def nueva_venta
  end

  def crear_venta
    @sale = Sale.create(client_id: params[:cliente])
    @sale_state = SaleState.create(sale_id: @sale.id, state_id: 1)
    @sale_product = SaleProduct.create(cantidad: params[:cantidad], sale_id: @sale.id, product_id: params[:producto])
    redirect_to root_path
  end
end
