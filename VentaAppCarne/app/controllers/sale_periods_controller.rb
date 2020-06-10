class SalePeriodsController < ApplicationController
  before_action :set_sale_period, only: [:show, :edit, :update, :destroy]
  def index
    @sale_periods = SalePeriod.all
  end

  def new
    @sale_period = SalePeriod.new
  end

  def create
    @sale_period = SalePeriod.create(sale_period_params)
    redirect_to sales_path
  end

  def show
  end

  def edit
  end

  def update
    @sale_period.update(sale_period_params)
    redirect_to sale_periods_path
  end

  def destroy
    @sale_period.destroy
    # @local_user = LocalUser.find_by(local_id: params[:id])
    # @local_user.update(local_id: nil)
    redirect_to sale_periods_path
  end

  def set_sale_period
    @sale_period = SalePeriod.find(params[:id])
  end

  def sale_period_params
    params.require(:sale_period).permit(
      :start,
      :end
    )
  end
end
