class SaloonsController < ApplicationController
  def index
    render json: Saloon.all
  end

  def show
    render json: Saloon.find(params[:id])
  end

  def create
    saloon = Saloon.new(saloon_params)

    if saloon.save
      render json: saloon, status: :created
    else
      render json: saloon.errors, status: :unprocessable_entity
    end
  end

  private

  def saloon_params
    params.require(:saloon).permit(:name, :gstin, :pan, :address)
  end
end
