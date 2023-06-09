class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @renting_space = RentingSpace.find(params[:renting_space_id])
    @booking = Booking.new
  end

  def create
    @renting_space = RentingSpace.find(params[:renting_space_id])

    @booking = Booking.new(booking_params)
    @booking.renting_space = @renting_space
    @booking.user = current_user
    @booking.save!

    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :users_id, :renting_spaces_id)
  end
end
