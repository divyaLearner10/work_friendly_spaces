class RentingSpacesController < ApplicationController
  before_action :set_renting_space, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    renting_spaces = RentingSpace.all
    @renting_spaces = renting_spaces[0..3]
    @images = [
      "place-1.jpg",
      "place-2.jpg",
      "place-3.jpg",
      "place-4.jpg",
      "place-5.jpg",
      "place-6.jpg",
      "place-7.jpg",
      "place-8.jpg",
      "place-9.jpg",
      "place-10.jpg",
      "place-11.jpg",
      "place-12.jpg",
      "place-13.jpg",
      "place-14.jpg",
      "place-15.jpg"
    ]
  end

  def index
    @renting_spaces = RentingSpace.all
    # @renting_spaces = renting_spaces[0...15]
    @images = [
      "place-1.jpg",
      "place-2.jpg",
      "place-3.jpg",
      "place-4.jpg",
      "place-5.jpg",
      "place-6.jpg",
      "place-7.jpg",
      "place-8.jpg",
      "place-9.jpg",
      "place-10.jpg",
      "place-11.jpg",
      "place-12.jpg",
      "place-13.jpg",
      "place-14.jpg",
      "place-15.jpg"
    ]
  end

  def show
    @booking = Booking.new

    @renting_spaces = RentingSpace.all
    # geocoder addition to filter RentingSpaces with coordinates
    @markers = @renting_spaces.geocoded.map do |renting_space|
      {
        lat: renting_space.latitude,
        lng: renting_space.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { renting_space: renting_space }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @user = current_user
    @renting_space = RentingSpace.new
  end

  def create
    @renting_space = RentingSpace.new(rentingspaces_params)
    @renting_space.amenities = params[:renting_space][:amenities]
    @renting_space.user = current_user
    @renting_space.save!

    redirect_to renting_space_path(@renting_space)
  end

  def edit
  end

  def update
     amenities = params[:renting_space][:amenities]
     params[:renting_space][:amenities] = amenities.is_a?(Array) ? amenities[1..amenities.length].join(",") : amenities

    if @renting_space.update(rentingspaces_params)
      redirect_to renting_space_path(@renting_space)
    else
      render :edit
    end
  end

  def destroy
    @renting_space.destroy

    redirect_to renting_spaces_path
  end

  private

  def set_renting_space
    @renting_space = RentingSpace.find(params[:id])
  end

  def rentingspaces_params
    params.require(:renting_space).permit(:name, :address, :amenities, :internet, :price, :description)
  end
end
