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
#User.destroy_all
Desk.destroy_all
Appointment.destroy_all
Level.destroy_all
puts "destroy finished"
" seeds in progress"
#User.create!(email:"moi@deskharmony.com", password: "coucou", first_name: "Mikael", last_name: "kel", job_title: "esclave" )
Level.create!(name: "etage1", svg:
  "<svg width='939' height='555' viewBox='0 0 939 555' fill='none' xmlns='http://www.w3.org/2000/svg' data-deskconnect-target='link'>
            <mask id='mask0_346_949' style='mask-type:alpha' maskUnits='userSpaceOnUse' x='0' y='0' width='939' height='555'>
            <path d='M0 7.99999C0 3.58172 3.58172 0 8 0H931C935.418 0 939 3.58172 939 8V546.864C939 551.282 935.418 554.864 931 554.864H8.00001C3.58173 554.864 0 551.282 0 546.864V7.99999Z' fill='white'/>
            </mask>
            <g mask='url(#mask0_346_949)'>
              <path d='M0 7.99999C0 3.58172 3.58172 0 8 0H930.007C934.426 0 938.007 3.58172 938.007 8V546.864C938.007 551.282 934.426 554.864 930.007 554.864H7.99999C3.58171 554.864 0 551.282 0 546.864V7.99999Z' fill='white'/>
              <rect x='90.0288' y='49.8437' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='1' data-action='click->deskconnect#book'/>
              <rect x='152.149' y='49.8437' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='2' data-action='click->deskconnect#book'/>
              <rect x='223.271' y='81.8189' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='48.6155' y='80.8784' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='90.0288' y='151.412' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='3' data-action='click->deskconnect#book'/>
              <rect x='152.149' y='151.412' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='4' data-action='click->deskconnect#book'/>
              <rect x='223.271' y='183.387' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='48.6155' y='182.447' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='90.0288' y='252.98' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='5' data-action='click->deskconnect#book'/>
              <rect x='152.149' y='252.98' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='6' data-action='click->deskconnect#book'/>
              <rect x='223.271' y='284.955' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='48.6155' y='284.015' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='90.0288' y='354.548' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='7' data-action='click->deskconnect#book'/>
              <rect x='152.149' y='354.548' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='8' data-action='click->deskconnect#book'/>
              <rect x='223.271' y='386.524' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='48.6155' y='385.583' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='349.312' y='49.8437' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='9' data-action='click->deskconnect#book'/>
              <rect x='411.431' y='49.8437' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='10' data-action='click->deskconnect#book'/>
              <rect x='482.554' y='81.8189' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='307.898' y='80.8784' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='349.312' y='151.412' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='11' data-action='click->deskconnect#book'/>
              <rect x='411.431' y='151.412' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='12' data-action='click->deskconnect#book'/>
              <rect x='482.554' y='183.387' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='307.898' y='182.447' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='349.312' y='252.98' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='13' data-action='click->deskconnect#book'/>
              <rect x='411.431' y='252.98' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='14' data-action='click->deskconnect#book'/>
              <rect x='482.554' y='284.955' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='307.898' y='284.015' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='349.312' y='354.548' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='15' data-action='click->deskconnect#book'/>
              <rect x='411.431' y='354.548' width='56.7181' height='87.4615' rx='8' fill='#D9D9D9' data-bureau='16' data-action='click->deskconnect#book'/>
              <rect x='482.554' y='386.524' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='307.898' y='385.583' width='27.0086' height='28.2134' rx='8' fill='#D9D9D9'/>
              <rect x='541.973' y='1.88086' width='32.4104' height='438.248' rx='8' fill='#D9D9D9'/>
              <rect x='-1.80054' y='20.6898' width='32.4104' height='504.079' rx='8' fill='#D9D9D9'/>
              <rect x='907.237' y='25.8076' width='32.4104' height='504.079' rx='8' fill='#D9D9D9'/>
              <rect x='-1.80054' y='31.9752' width='33.8561' height='1036.23' rx='8' transform='rotate(-90 -1.80054 31.9752)' fill='#D9D9D9'/>
              <rect x='-1.80054' y='556.745' width='33.8561' height='1036.23' rx='8' transform='rotate(-90 -1.80054 556.745)' fill='#D9D9D9'/>
              <rect x='611.596' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 611.596 189.03)' fill='#D9D9D9' data-bureau='17' data-action='click->deskconnect#form'/>
              <rect x='642.206' y='114.734' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 642.206 114.734)' fill='#D9D9D9'/>
              <rect x='700.725' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 700.725 189.03)' fill='#D9D9D9' data-bureau='18' data-action='click->deskconnect#form'/>
              <rect x='731.334' y='114.734' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 731.334 114.734)' fill='#D9D9D9'/>
              <rect x='789.853' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 789.853 189.03)' fill='#D9D9D9' data-bureau='19' data-action='click->deskconnect#form'/>
              <rect x='820.463' y='114.734' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 820.463 114.734)' fill='#D9D9D9'/>
              <rect x='-1.80054' y='556.745' width='33.8561' height='1036.23' rx='8' transform='rotate(-90 -1.80054 556.745)' fill='#D9D9D9'/>
              <rect x='551.876' y='271.789' width='190.861' height='11.2854' rx='5.64268' fill='#D9D9D9'/>
              <rect x='811.159' y='274.61' width='190.861' height='8.46402' rx='4.23201' fill='#D9D9D9'/>
            </g>
          </svg>"
)

level = Level.find_by(name: "etage1")
for n in 0..19
  Desk.create!(name: n, level: 1, description: "super!" , level_id:level)
end
" seeds have been created"
