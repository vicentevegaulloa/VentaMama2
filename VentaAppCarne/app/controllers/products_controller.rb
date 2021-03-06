class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
      subquery = Product.select("MAX(id) AS max_id").group(:name).to_sql
      @products = Product.joins("INNER JOIN (#{subquery}) AS updated ON updated.max_id=products.id")
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
      puts "PRODUCTO: #{@product}"
      if not @product.estimated_weight
        @product.update(estimated_weight: 1)
      end
      redirect_to products_path
    end

    def show
    end

    def edit
    end

    def update
      @product.update(product_params)
      if not @product.estimated_weight
        @product.update(estimated_weight: 1)
      end
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
      :supp_price,
      :estimated_weight
    )
  end
end
