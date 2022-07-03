class MatchPro
  def initialize(booking:)
    @booking = booking
  end

  def call
    match_prestations
    match_distance
    match_open
    match_available

    @matched_pros
  end

  private

  def match_prestations
    booking_refs = @booking.prestations.pluck(:reference)
    @matched_pros = Pro.joins(:prestations).where(prestations: { reference: booking_refs })
  end

  def match_distance
    excluded_ids = []
    @matched_pros.each do |pro|
      byebug
      distance = Geocoder::Calculations.distance_between(pro, @booking)
      excluded_ids << pro.id if distance > pro.max_kilometers
    end

    @matched_pros = @matched_pros.where.not(id: excluded_ids)
  end

  def match_open
  end

  def match_available
  end
end
