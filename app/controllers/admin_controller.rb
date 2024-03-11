class AdminController < ApplicationController
  before_action :authenticate_admin!
  
  def home
  end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
