class ListingsController < ApplicationController
  
  def new
    @listing = Listing.new
  end

  def create
    binding.pry
    @listing = current_user.listings.create(listing_params)
    redirect_to @listing
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def index
    @listings = Listing.all
  end

  private 
  def listing_params
    params.require(:listing).permit(:title, :description, :address, :price, :neighborhood_id, neighborhood_attributes: [:name])
  end
end
