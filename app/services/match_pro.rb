class MatchPro
  def initialize(booking:)
    @booking = booking
  end

  def call
    match_prestations
    match_distance
    match_day
    match_hour
    match_available

    @matched_pros
  end

  def match_prestations
    booking_refs = @booking.prestations.pluck(:reference)
    @matched_pros = Pro.has_prestations(references: booking_refs)
  end

  def match_distance
    @matched_pros = Pro.near(@booking, :max_kilometers, units: :km)
  end

  def match_day
    @booking_day = @booking.starts_at.strftime("%A").downcase
    @matched_pros = Pro.open_at(day: @booking_day)
  end

  def match_hour
    excluded_ids = []

    @booking.prestations.each do |prestation|
      @matched_pros.each do |pro|
        pro_day_hours = pro.opening_hours.find_by(day: @booking_day)
        start_time_check = booking_start_time(@booking).strftime("%H:%M") > pro_day_hours.starts_at.to_datetime
        end_time_check = booking_end_time(@booking, prestation).strftime("%H:%M") < pro_day_hours.ends_at.to_datetime

        excluded_ids << pro.id unless start_time_check && end_time_check
      end
    end

    @matched_pros = @matched_pros.where.not(id: excluded_ids)
  end

  def match_available
    Pro.available_at(start_time: booking_start_time, end_time: booking_end_time)
  end

  private

  def booking_start_time
    @booking.starts_at.in_time_zone("Europe/Paris")
  end

  def booking_end_time
    booking_start_time + @booking.prestations.sum(&:duration).minutes
  end
end
