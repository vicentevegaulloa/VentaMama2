class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
      @products = Product.all
    end

    def new
      if params[:base_id]
        @base = Product.find(params[:base_id])
      else
        @base = nil
      end
      @product = Product.new
    end

    def create
      @product = Product.create(product_params)
      redirect_to products_path
    end

    def show
    end

    def edit
    end

    def update
      @product.update(product_params)
      redirect_to products_path
    end

    def destroy
      @product.destroy
      # @local_user = LocalUser.find_by(local_id: params[:id])
      # @local_user.update(local_id: nil)
      redirect_to products_path
    end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :unit_price,
      :unit_metric,
      :supp_price
    )
  end
end
