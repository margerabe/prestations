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

  private

  def match_prestations
    booking_refs = @booking.prestations.pluck(:reference)
    @matched_pros = Pro.joins(:prestations).where(prestations: { reference: booking_refs })
  end

  def match_distance
    excluded_ids = []

    @matched_pros.each do |pro|
      distance = Geocoder::Calculations.distance_between(pro, @booking)
      excluded_ids << pro.id if distance > pro.max_kilometers
    end

    @matched_pros = @matched_pros.where.not(id: excluded_ids)
  end

  def match_day
    excluded_ids = []
    @booking_day = @booking.starts_at.strftime("%A").downcase

    @matched_pros.each do |pro|
      excluded_ids << pro.id unless pro.opening_hours.pluck(:day).include?(@booking_day)
    end

    @matched_pros = @matched_pros.where.not(id: excluded_ids)
  end

  def match_hour
    excluded_ids = []

    @booking.prestations.each do |prestation|
      @matched_pros.each do |pro|
        pro_day_hours = pro.opening_hours.find_by(day: @booking_day)
        start_time_check = booking_start_time(@booking).strftime("%H:%M") > pro_day_hours.starts_at
        end_time_check = booking_end_time(@booking, prestation).strftime("%H:%M") < pro_day_hours.ends_at

        excluded_ids << pro.id unless start_time_check && end_time_check
      end
    end

    @matched_pros = @matched_pros.where.not(id: excluded_ids)
  end

  def match_available
    excluded_ids = []

    @matched_pros.each do |pro|
      pro.appointments.each do |appointment|
        range = appointment.starts_at..appointment.ends_at
        excluded_ids << pro.id if range.cover?(booking_start_time(@booking))
      end
    end

    @matched_pros = @matched_pros.where.not(id: excluded_ids)
  end

  def booking_start_time(booking)
    booking.starts_at.in_time_zone("Europe/Paris")
  end

  def booking_end_time(booking, prestation)
    booking_start_time(booking) + prestation.duration.minutes
  end
end
