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
User.create!(email:"toi@deskharmony.com", password: "coucou", first_name: "Mikaellette", last_name: "kellette", job_title: "maitre", nickname: "paulette" )
Level.create!(name: "1", svg:
  "<svg width='939' height='555' viewBox='0 0 939 555' fill='none' xmlns='http://www.w3.org/2000/svg'>

<path d='M8 5H930.007C931.664 5 933.007 6.34314 933.007 8V546.864C933.007 548.521 931.664 549.864 930.007 549.864H7.99999C6.34314 549.864 5 548.521 5 546.864V7.99999C5 6.34314 6.34314 5 8 5Z'  />
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
<rect x='545' y='6' width='13' height='438'  fill='#D9D9D9'/>
<rect x='611.596' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 611.596 189.03)' fill='#D9D9D9' data-bureau='17' data-action='click->deskconnect#book'/>
<rect x='642.206' y='114.735' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 642.206 114.735)' fill='#D9D9D9'/>
<rect x='700.725' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 700.725 189.03)' fill='#D9D9D9' data-bureau='18' data-action='click->deskconnect#book'/>
<rect x='731.334' y='114.735' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 731.334 114.735)' fill='#D9D9D9'/>
<rect x='789.853' y='189.03' width='59.2482' height='83.7268' rx='8' transform='rotate(-90 789.853 189.03)' fill='#D9D9D9' data-bureau='19' data-action='click->deskconnect#book'/>
<rect x='820.463' y='114.735' width='28.2134' height='27.0086' rx='8' transform='rotate(-90 820.463 114.735)' fill='#D9D9D9'/>
<rect x='551.876' y='271.789' width='190.861' height='11.2854'  fill='#D9D9D9'/>
<rect x='811.159' y='274.61' width='120' height='8.46402'  fill='#D9D9D9'/>
<foreignObject x='90.0288' y='49.8437' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='1'> </div>
</foreignObject>
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
for n in 1..19
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
user = User.find_by(last_name: "kel")

Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 10).id, start_at: "2024-01-15")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-01-16")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 24).id, start_at: "2024-01-27")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 19).id, start_at: "2024-01-28")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-01-29")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-02-05")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 6).id, start_at: "2024-02-06")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 10).id, start_at: "2024-02-07")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 20).id, start_at: "2024-02-14")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-02-15")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 3).id, start_at: "2024-02-16")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 3).id, start_at: "2024-02-19")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 8).id, start_at: "2024-02-20")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 6).id, start_at: "2024-02-21")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 15).id, start_at: "2024-02-26")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 17).id, start_at: "2024-02-27")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-02-29")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 10).id, start_at: "2024-03-04")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 18).id, start_at: "2024-03-05")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 13).id, start_at: "2024-03-06")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 25).id, start_at: "2024-03-11")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 4).id, start_at: "2024-03-12")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 3).id, start_at: "2024-03-14")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-03-19")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-03-20")
Appointment.create!(user_id: user.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-03-22")

puts " appointment in created"

Chatroom.create!(name: 1);
