class SearchesController < ApplicationController

  def index
    @search = Sale.all
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:client_id, :updated_open, :updated_close, :order, :total_min, :total_max, :sector, :products => [], :states => [])
  end
end
