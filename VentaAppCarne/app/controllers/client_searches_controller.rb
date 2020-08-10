class ClientSearchesController < ApplicationController
  def index
    @search = Client.all
  end

  def new
    @search = ClientSearch.new
  end

  def create
    @search = ClientSearch.create!(client_search_params)
    redirect_to @search
  end

  def show
    @search = ClientSearch.find(params[:id])
  end

  def client_search_params
    params.require(:client_search).permit()
  end
end
