class RentingSpacesController < ApplicationController
  before_action :set_renting_space, only: [:show, :edit, :update, :destroy]

  def index
    @renting_spaces = RentingSpace.all
  end

  def show
  end

  def new
    @user = current_user
    @renting_space = RentingSpace.new
  end

  def create
    @renting_space = RentingSpace.new(rentingspaces_params)
    @renting_space.user = current_user
    @renting_space.save
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
    params.require(:renting_space).permit(:name)
  end
end
