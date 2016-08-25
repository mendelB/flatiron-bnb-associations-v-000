class ReservationsController < ApplicationController
  
  def new
    @reservation = Reservation.new
    find_listing
  end

  def create
    find_listing
    @reservation = current_user.trips.create(reservation_params.merge(listing: @listing))
    redirect_to listing_reservation_path(@listing, @reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end
  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout)
  end
end
