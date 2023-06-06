class RentingSpacesController < ApplicationController
  def index
    @renting_spaces = RentingSpace.all
  end

  # def show
  #   @renting_space = RentingSpace.find(params[:id])
  # end

  # def new
  #   @renting_space = RentingSpace.new
  # end

  # def create
  #   @renting_space = RentingSpace.new(rentingspaces_params)
  #   @renting_space.save
  # end

  # def edit
  #   @renting_space = RentingSpace.find(:id)
  # end

  # def update
  #   @renting_space = RentingSpace.find(:id)
  #   @renting_space.update
  # end

  # def destroy
  #   @renting_space = RentingSpace.find(:id)
  #   @renting_space.destroy
  # end

  # private

  # def rentingspaces_params
  #   params.require(:renting_space).permit(:name, :address, :aminities, :internet, :user_id)
  # end
end
