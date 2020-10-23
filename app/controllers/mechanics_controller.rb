class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    RideMechanic.create!(ride: ride, mechanic: mechanic)
    redirect_to mechanic_path(mechanic)
  end
end
