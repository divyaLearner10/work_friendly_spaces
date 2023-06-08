class RentingSpacesController < ApplicationController
  before_action :set_renting_space, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    renting_spaces = RentingSpace.all
    @renting_spaces = renting_spaces[0..3]
  end

  def index
    @renting_spaces = RentingSpace.all
  end

  def show
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
    @renting_space.user = current_user
    @renting_space.save!

    redirect_to renting_spaces_path
  end

  def edit
  end

  def update
    @renting_space.update(params[:renting_space])
  end

  def destroy
    @renting_space.destroy
  end

  private

  def set_renting_space
    @renting_space = RentingSpace.find(params[:id])
  end

  def rentingspaces_params
    params.require(:renting_space).permit(:name, :address, :amenities, :internet)
  end
end
