class BookingsController < ApplicationController
  def new
    @renting_space = RentingSpace.find(params[:renting_space_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @renting_space = RentingSpace.find(params[:renting_space_id])
    @booking.renting_space = @renting_space
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :users_id, :renting_spaces_id)
  end
end
