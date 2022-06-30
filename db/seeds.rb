puts '-- START OF SEED --'

puts 'Destroying existing records...'

ProPrestation.destroy_all
BookingPrestation.destroy_all
Pro.destroy_all
Booking.destroy_all
Prestation.destroy_all
Appointment.destroy_all
OpeningHour.destroy_all

puts 'Creating new records...'

parsed_file = JSON.parse(File.read('db/data.json'))

parsed_file['prestations'].each do |prestation_params|
  Prestation.create!(prestation_params)
end

parsed_file['pros'].each do |pro_params|
  pro = Pro.create!(pro_params.except('prestations', 'opening_hours', 'appointments'))
  pro.appointments.create!(pro_params['appointments'])
  pro.opening_hours.create!(pro_params['opening_hours'])
  pro_params['prestations'].each do |prestation_reference|
    pro.prestations << Prestation.find_by(reference: prestation_reference)
  end
end

parsed_file['bookings'].each do |booking_params|
  booking = Booking.create!(booking_params.except('prestations'))
  booking_params['prestations'].each do |prestation_reference|
    booking.prestations << Prestation.find_by(reference: prestation_reference)
  end
end

puts "Prestations created: #{Prestation.count}"
puts "Pro's created: #{Pro.count}"
puts "ProPrestations created: #{ProPrestation.count}"
puts "Appointments created: #{Appointment.count}"
puts "Opening Hours created: #{OpeningHour.count}"
puts "Bookings created: #{Booking.count}"
puts "BookingPrestations created: #{BookingPrestation.count}"

puts '-- END OF SEED --'
