class Public::DestinationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_destination, only: [:edit, :update, :destroy]

  def index
    @destination = Destination.new
    @destinations = current_customer.destinations.all
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.customer_id = current_customer.id
    if @destination.save
      redirect_to destinations_path
    else
      @destinations = current_customer.destinations.all
      render :index
    end
  end

  def edit
  end

  def update
    if @destination.update(destination_params)
      redirect_to destinations_path
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end


  private

  def destination_params
    params.require(:destination).permit(:postal_code, :place, :name)
  end

  def set_destination
    @destination = Destination.find(params[:id])
  end

end