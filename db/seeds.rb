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
User.destroy_all
Desk.destroy_all
Appointment.destroy_all
Level.destroy_all
puts "destroy finished"
" seeds in progress"
User.create!(email:"moi@deskharmony.com", password: "coucou", first_name: "Mikael", last_name: "kel", job_title: "esclave", nickname: "paulo" )
Level.create!(name: "1", svg:
  "<svg width='939' height='555' viewBox='0 0 939 555' fill='none' xmlns='http://www.w3.org/2000/svg'>
<mask id='mask0_27_98' style='mask-type:alpha' maskUnits='userSpaceOnUse' x='0' y='0' width='939' height='555'>
<path d='M0 7.99999C0 3.58172 3.58172 0 8 0H931C935.418 0 939 3.58172 939 8V546.864C939 551.282 935.418 554.864 931 554.864H8.00001C3.58173 554.864 0 551.282 0 546.864V7.99999Z' fill='white' />
</mask>
<g mask='url(#mask0_27_98)'>
<path d='M8 5H930.007C931.664 5 933.007 6.34314 933.007 8V546.864C933.007 548.521 931.664 549.864 930.007 549.864H7.99999C6.34314 549.864 5 548.521 5 546.864V7.99999C5 6.34314 6.34314 5 8 5Z' fill='#D9D9D9' fill-opacity='0.4' stroke='#D9D9D9' stroke-width='2'/>
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
<rect x='545' y='4' width='13' height='438'  fill='#D9D9D9'/>
<rect x='611.596' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 611.596 189.03)' fill='#D9D9D9' data-bureau='17' data-action='click->deskconnect#book'/>
<rect x='642.206' y='114.735' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 642.206 114.735)' fill='#D9D9D9'/>
<rect x='700.725' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 700.725 189.03)' fill='#D9D9D9' data-bureau='18' data-action='click->deskconnect#book'/>
<rect x='731.334' y='114.735' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 731.334 114.735)' fill='#D9D9D9'/>
<rect x='789.853' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 789.853 189.03)' fill='#D9D9D9' data-bureau='19' data-action='click->deskconnect#book'/>
<rect x='820.463' y='114.735' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 820.463 114.735)' fill='#D9D9D9'/>
<rect x='551.876' y='271.789' width='190.861' height='11.2854'  fill='#D9D9D9'/>
<rect x='811.159' y='274.61' width='120' height='8.46402'  fill='#D9D9D9'/>
</g>
</svg>
"
);
Level.create!(name: "2", svg:
  "
<svg width='942' height='559' viewBox='0 0 942 559' fill='none'  xmlns='http://www.w3.org/2000/svg'>
<path d='M2 10.0001C2 5.58178 5.58172 2.00006 10 2.00006H932.007C936.426 2.00006 940.007 5.58178 940.007 10.0001V548.864C940.007 553.282 936.426 556.864 932.007 556.864H9.99999C5.58171 556.864 2 553.282 2 548.864V10.0001Z' fill='white' fill-opacity='50%'/>
<rect x='659.509' y='499.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 659.509 499.727)' fill='#D9D9D9' data-bureau='20' data-action='click->deskconnect#book'/>
<rect x='585.214' y='469.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 585.214 469.117)' fill='#D9D9D9'/>
<rect x='548.509' y='501.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 548.509 501.727)' fill='#D9D9D9' data-bureau='21' data-action='click->deskconnect#book'/>
<rect x='474.214' y='471.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 474.214 471.117)' fill='#D9D9D9'/>
<rect x='0.199463' y='22.6899' width='32.4104' height='504.079' rx='8' fill='#D9D9D9'/>
<rect x='909.237' y='27.8077' width='32.4104' height='504.079' rx='8' fill='#D9D9D9'/>
<rect y='34' width='34' height='942' rx='8' transform='rotate(-90 0 34)' fill='#D9D9D9'/>
<rect y='559' width='34' height='938' rx='8' transform='rotate(-90 0 559)' fill='#D9D9D9'/>
<rect x='168.509' y='260.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 168.509 260.727)' fill='#D9D9D9' data-bureau='22' data-action='click->deskconnect#book'/>
<rect x='94.2134' y='230.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 94.2134 230.117)' fill='#D9D9D9'/>
<rect x='168.509' y='143.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 168.509 143.727)' fill='#D9D9D9' data-bureau='23' data-action='click->deskconnect#book'/>
<rect x='94.2134' y='113.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 94.2134 113.117)' fill='#D9D9D9'/>
<rect x='168.509' y='498.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 168.509 498.727)' fill='#D9D9D9' data-bureau='24' data-action='click->deskconnect#book'/>
<rect x='94.2134' y='468.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 94.2134 468.117)' fill='#D9D9D9'/>
<rect x='168.509' y='381.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 168.509 381.727)' fill='#D9D9D9' data-bureau='25' data-action='click->deskconnect#book'/>
<rect x='94.2134' y='351.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 94.2134 351.117)' fill='#D9D9D9'/>
<rect x='333.509' y='260.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 333.509 260.727)' fill='#D9D9D9' data-bureau='26' data-action='click->deskconnect#book'/>
<rect x='259.213' y='230.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 259.213 230.117)' fill='#D9D9D9' />
<rect x='333.509' y='143.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 333.509 143.727)' fill='#D9D9D9' data-bureau='28' data-action='click->deskconnect#book'/>
<rect x='259.213' y='113.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 259.213 113.117)' fill='#D9D9D9'/>
<rect x='333.509' y='498.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 333.509 498.727)' fill='#D9D9D9' data-bureau='29' data-action='click->deskconnect#book'/>
<rect x='259.213' y='468.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 259.213 468.117)' fill='#D9D9D9' />
<rect x='333.509' y='381.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 333.509 381.727)' fill='#D9D9D9' data-bureau='30' data-action='click->deskconnect#book'/>
<rect x='259.213' y='351.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 259.213 351.117)' fill='#D9D9D9'/>
<rect x='579' y='144.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 579 144.509)' fill='#D9D9D9' data-bureau='31' data-action='click->deskconnect#book'/>
<rect x='609.61' y='70.2134' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 609.61 70.2134)' fill='#D9D9D9'/>
<rect x='465' y='141.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 465 141.509)' fill='#D9D9D9' data-bureau='32' data-action='click->deskconnect#book'/>
<rect x='495.61' y='67.2134' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 495.61 67.2134)' fill='#D9D9D9'/>
<rect x='775.509' y='499.727' width='59.2482' height='83.7268' rx='8' transform='rotate(-180 775.509 499.727)' fill='#D9D9D9' data-bureau='33' data-action='click->deskconnect#book'/>
<rect x='701.214' y='469.117' width='28.2134' height='27.0086' rx='8' transform='rotate(-180 701.214 469.117)' fill='#D9D9D9'/>
<rect x='804' y='144.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 804 144.509)' fill='#D9D9D9' data-bureau='34' data-action='click->deskconnect#book'/>
<rect x='834.61' y='70.2134' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 834.61 70.2134)' fill='#D9D9D9'/>
<rect x='687' y='145.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 687 145.509)' fill='#D9D9D9' data-bureau='35' data-action='click->deskconnect#book'/>
<rect x='717.61' y='71.2134' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 717.61 71.2134)' fill='#D9D9D9'/>
<rect x='581' y='260.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 581 260.509)' fill='#D9D9D9' data-bureau='36' data-action='click->deskconnect#book'/>
<rect x='611.61' y='186.213' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 611.61 186.213)' fill='#D9D9D9'/>
<rect x='467' y='257.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 467 257.509)' fill='#D9D9D9' data-bureau='37' data-action='click->deskconnect#book'/>
<rect x='497.61' y='183.213' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 497.61 183.213)' fill='#D9D9D9'/>
<rect x='806' y='260.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 806 260.509)' fill='#D9D9D9' data-bureau='38' data-action='click->deskconnect#book'/>
<rect x='836.61' y='186.213' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 836.61 186.213)' fill='#D9D9D9'/>
<rect x='689' y='261.509' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 689 261.509)' fill='#D9D9D9' data-bureau='39' data-action='click->deskconnect#book'/>
<rect x='719.61' y='187.213' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 719.61 187.213)' fill='#D9D9D9'/>
</svg>"
);





level = Level.find_by(name: "etage1")
for n in 0..19
  Desk.create!(name: n, level: 1, description: "super!" , level_id:level)
end
level = Level.find_by(name: "etage2")
for n in 20..39
  Desk.create!(name: n, level: 2, description: "super!" , level_id:level)
end
#level = Level.find_by(name: "etage3")
#for n in 40..58
#  Desk.create!(name: n, level: 3, description: "super!" , level_id:level)
#end
#level = Level.find_by(name: "etage4")
#for n in 60..78
#  Desk.create!(name: n, level: 4, description: "super!" , level_id:level)
#end
" seeds have been created"

puts " appointment in progress"
Appointment.create!(user_id: 1, desk_id: 10, start_at: "2024-01-15 09:00:00", end_at: "2024-01-15 18:00:00")
Appointment.create!(user_id: 1, desk_id: 23, start_at: "2024-01-16 09:00:00", end_at: "2024-01-16 18:00:00")
Appointment.create!(user_id: 1, desk_id: 24, start_at: "2024-01-27 09:00:00", end_at: "2024-01-27 18:00:00")
Appointment.create!(user_id: 1, desk_id: 19, start_at: "2024-01-28 09:00:00", end_at: "2024-01-28 18:00:00")
Appointment.create!(user_id: 1, desk_id: 2, start_at: "2024-01-29 09:00:00", end_at: "2024-01-29 18:00:00")
Appointment.create!(user_id: 1, desk_id: 2, start_at: "2024-02-05 09:00:00", end_at: "2024-02-05 18:00:00")
Appointment.create!(user_id: 1, desk_id: 6, start_at: "2024-02-06 09:00:00", end_at: "2024-02-06 18:00:00")
Appointment.create!(user_id: 1, desk_id: 10, start_at: "2024-02-07 09:00:00", end_at: "2024-02-07 18:00:00")
Appointment.create!(user_id: 1, desk_id: 20, start_at: "2024-02-14 09:00:00", end_at: "2024-02-14 18:00:00")
Appointment.create!(user_id: 1, desk_id: 2, start_at: "2024-02-15 09:00:00", end_at: "2024-02-15 18:00:00")
Appointment.create!(user_id: 1, desk_id: 3, start_at: "2024-02-16 09:00:00", end_at: "2024-02-16 18:00:00")
Appointment.create!(user_id: 1, desk_id: 3, start_at: "2024-02-19 09:00:00", end_at: "2024-02-19 18:00:00")
Appointment.create!(user_id: 1, desk_id: 8, start_at: "2024-02-20 09:00:00", end_at: "2024-02-20 18:00:00")
Appointment.create!(user_id: 1, desk_id: 6, start_at: "2024-02-21 09:00:00", end_at: "2024-02-21 18:00:00")
Appointment.create!(user_id: 1, desk_id: 15, start_at: "2024-02-26 09:00:00", end_at: "2024-02-26 18:00:00")
Appointment.create!(user_id: 1, desk_id: 17, start_at: "2024-02-27 09:00:00", end_at: "2024-02-27 18:00:00")
Appointment.create!(user_id: 1, desk_id: 23, start_at: "2024-02-29 09:00:00", end_at: "2024-02-29 18:00:00")
Appointment.create!(user_id: 1, desk_id: 10, start_at: "2024-03-04 09:00:00", end_at: "2024-03-04 18:00:00")
Appointment.create!(user_id: 1, desk_id: 18, start_at: "2024-03-05 09:00:00", end_at: "2024-03-05 18:00:00")
Appointment.create!(user_id: 1, desk_id: 13, start_at: "2024-03-06 09:00:00", end_at: "2024-03-06 18:00:00")
Appointment.create!(user_id: 1, desk_id: 25, start_at: "2024-03-11 09:00:00", end_at: "2024-03-11 18:00:00")
Appointment.create!(user_id: 1, desk_id: 4, start_at: "2024-03-12 09:00:00", end_at: "2024-03-12 18:00:00")
Appointment.create!(user_id: 1, desk_id: 3, start_at: "2024-03-14 09:00:00", end_at: "2024-03-14 18:00:00")
Appointment.create!(user_id: 1, desk_id: 23, start_at: "2024-03-19 09:00:00", end_at: "2024-03-19 18:00:00")
Appointment.create!(user_id: 1, desk_id: 2, start_at: "2024-03-20 09:00:00", end_at: "2024-03-20 18:00:00")
Appointment.create!(user_id: 1, desk_id: 23, start_at: "2024-03-22 09:00:00", end_at: "2024-03-22 18:00:00")

puts " appointment in created"
