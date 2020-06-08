class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_direction, only: [:show, :edit]
  def index
      @clientes = Client.all
    end

    def new
      @client = Client.new
      @direction = @client.build_direction
    end

    def create
      @client = Client.create(client_params)
      redirect_to clients_path
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
      # @local_user = LocalUser.find_by(local_id: params[:id])
      # @local_user.update(local_id: nil)
      redirect_to clients_path
    end

  def set_client
    @client = Client.find(params[:id])
  end

  def set_direction
    @direction = Direction.find_by(client_id: @client.id)
  end

  def client_params
    params.require(:client).permit(
      :name,
      :phone,
      :name_phone,
      direction_attributes:
        [
          :id,
          :sector,
          :street,
          :muni_n,
          :comuna,
          :unidad,
          :n_unidad,
          :_destroy
          ])
  end
end
