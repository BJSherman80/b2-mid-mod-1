class RepairsController < ApplicationController

  def create
      @mechanic = Mechanic.find_by(id: params[:id])
    if Ride.exists?(id: params[:ride_id])
      ride = Ride.find_by(id: params[:ride_id])
      mechanic = Mechanic.find_by(id: params[:id])
      Repair.create(mechanic_id: mechanic.id, ride_id: ride.id)
      redirect_to "/mechanics/#{mechanic.id}"
    else
      flash[:notice] = 'Ride does not exist.'
      redirect_to "/mechanics/#{@mechanic.id}"
    end
  end
end
