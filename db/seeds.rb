# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

puts " destroy in progress"
Desk.destroy_all
Appointment.destroy_all
puts "destroy finished"
" seeds in progress"
User.create!(email:"moi@deskharmony.com", password: "coucou", first_name: "Mikael", last_name: "kel", job_title: "esclave" )
for n in 0..19
  Desk.create!(name: n, level: 1, description: "super!")
end
" seeds have been created"
