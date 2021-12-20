class ServicesController < ApplicationController
  def index
    render json: Service.availableServicesForSaloon(params[:saloon_id])
  end

  def show
    render json: Service.find(params[:id])
  end

  def create
    service = Service.new(service_params)

    if service.save
      render json: service, status: :created
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  private

  def service_params
    params.require(:service).permit(:saloon_id, :name, :duration, :cost)
  end
end
