class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def add_ride
    if Ride.exists?(id: params[:ride_id])
      ride = Ride.find_by(id: params[:ride_id])
      mechanic= Mechanic.find_by(id: params[:id])
      mechanic.rides << ride
      redirect_to "/mechanics/#{mechanic.id}"
    else
      flash[:notice] = 'Ride does not exist.'
    end
  end



end
