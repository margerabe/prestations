class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params.except(:prestation_ids))
    @booking.prestation_ids = Prestation.where(reference: params[:booking][:prestation_ids].reject(&:blank?)).pluck(:id)

    redirect_to booking_path(@booking) if @booking.save!
  end

  def show
    @booking = Booking.find(params[:id])
    @matched_pros = MatchPro.new(booking: @booking).call.pluck(:name)
  end

  private

  def booking_params
    params.require(:booking).permit(:email, :name, :starts_at, :address, prestation_references: [])
  end
end
