class MatchPro
  def initialize(booking:, method_spec: false)
    @booking = booking
    @method_spec = method_spec
  end

  def call
    match_distance
    match_prestations
    match_opening_hour
    match_available
  end

  def match_distance
    @matched_pros = Pro.where(Pro.distance_sql(@booking, :kms) + " < max_kilometers")
  end

  def match_prestations
    booking_refs = @booking.prestations.pluck(:reference)
    @matched_pros = pro_collection.has_prestations(references: booking_refs)
  end

  def match_opening_hour
    @booking_day = @booking.starts_at.strftime("%A").downcase
    @matched_pros = pro_collection.open_at(day: @booking_day, start_time: to_time(booking_start_time),
                                           end_time: to_time(booking_end_time))
  end

  def match_available
    @matched_pros = pro_collection.available_at(start_time: booking_start_time, end_time: booking_end_time)
  end

  private

  def pro_collection
    # Check if we are testing an individual method from the spec or full suite
    @method_spec ? Pro : @matched_pros
  end

  def booking_start_time
    @booking.starts_at.in_time_zone("Europe/Paris")
  end

  def booking_end_time
    booking_start_time + @booking.prestations.sum(&:duration).minutes
  end

  def to_time(date)
    Time.new(2000, 1, 1, date.hour, date.min, date.sec)
  end
end
