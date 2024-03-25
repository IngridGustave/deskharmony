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
puts " 1"
Desk.destroy_all
puts " 2"
Appointment.destroy_all
puts " 3"
Level.destroy_all
puts " 4"
TeamUser.destroy_all
puts " 5"
Team.destroy_all
puts "destroy finished"
" seeds in progress"

puts "creating users"

laura = User.new(email:"laura@deskharmony.com", password: "coucou", first_name: "Laura", last_name: "Vidal", job_title: "Dev", nickname: "Laura" )
laura_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194826/laura_dyqsnu.png')
laura.photo.attach(io: laura_file, filename: "laura.png", content_type: "image/png")
laura.save

fabien = User.new(email:"fabien@deskharmony.com", password: "coucou", first_name: "Fabien", last_name: "Pittiani", job_title: "Dev", nickname: "Fabien" )
fabien_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194822/fabien_smrycv.jpg')
fabien.photo.attach(io: fabien_file, filename: "fabien.png", content_type: "image/png")
fabien.save

ingrid = User.new(email:"ingrid@deskharmony.com", password: "coucou", first_name: "Ingrid", last_name: "Gustave", job_title: "Dev", nickname: "Ingrid" )
ingrid_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194826/ingrid_vszkta.jpg')
ingrid.photo.attach(io: ingrid_file, filename: "ingrid.png", content_type: "image/png")
ingrid.save


ines = User.new(email:"ines@deskharmony.com", password: "coucou", first_name: "Ines", last_name: "Alvergne", job_title: "Data analyst", nickname: "Ines" )
ines_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194822/ines_uqlmow.jpg')
ines.photo.attach(io: ines_file, filename: "ines.png", content_type: "image/png")
ines.save

seb = User.new(email:"seb@deskharmony.com", password: "coucou", first_name: "Sebastien", last_name: "Saunier", job_title: "Data analyst", nickname: "Seb" )
seb_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194829/seb_gujojg.jpg')
seb.photo.attach(io: seb_file, filename: "seb.png", content_type: "image/png")
seb.save

alex = User.new(email:"alex@deskharmony.com", password: "coucou", first_name: "Alex", last_name: "Platteeuw", job_title: "Business analyst", nickname: "Alex" )
alex_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194822/alex_ezurq3.jpg')
alex.photo.attach(io: alex_file, filename: "alex.png", content_type: "image/png")
alex.save

florine = User.new(email:"florine@deskharmony.com", password: "coucou", first_name: "Florine", last_name: "Humbert", job_title: "Manager", nickname: "Florine" )
florine_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194822/florine_wxmen7.png')
florine.photo.attach(io: florine_file, filename: "florine.png", content_type: "image/png")
florine.save

charlie = User.new(email:"charlie@deskharmony.com", password: "coucou", first_name: "Charlie", last_name: "Bertrand", job_title: "Manager", nickname: "Charlie" )
charlie_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194822/charlie_ujx7tz.png')
charlie.photo.attach(io: charlie_file, filename: "charlie.png", content_type: "image/png")
charlie.save

maelie = User.new(email:"maelie@deskharmony.com", password: "coucou", first_name: "Maelie", last_name: "Poussier", job_title: "Business analyst", nickname: "Maelie" )
maelie_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194827/maelie_l7ojtt.png')
maelie.photo.attach(io: maelie_file, filename: "maelie.png", content_type: "image/png")
maelie.save

gwendal = User.new(email:"gwendal@deskharmony.com", password: "coucou", first_name: "Gwendal", last_name: "Le Bris", job_title: "Data scientist", nickname: "Gwendal" )
gwendal_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194822/gwendal_fee8jy.jpg')
gwendal.photo.attach(io: gwendal_file, filename: "gwendal.png", content_type: "image/png")
gwendal.save

julien = User.new(email:"julien@deskharmony.com", password: "coucou", first_name: "Julien", last_name: "Marchand", job_title: "Data scientist", nickname: "Julien" )
julien_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194826/julien_sdevve.jpg')
julien.photo.attach(io: julien_file, filename: "julien.png", content_type: "image/png")
julien.save

kevin = User.new(email:"kevin@deskharmony.com", password: "coucou", first_name: "Kevin", last_name: "Abergel", job_title: "Data engineer", nickname: "Kevin" )
kevin_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194826/kevin_mvgiuo.jpg')
kevin.photo.attach(io: kevin_file, filename: "kevin.png", content_type: "image/png")
kevin.save

alexis = User.new(email:"alexis@deskharmony.com", password: "coucou", first_name: "Alexis", last_name: "Stephan", job_title: "Data engineer", nickname: "Alexis" )
alexis_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711194822/alexis_jurpju.jpg')
alexis.photo.attach(io: alexis_file, filename: "alexis.png", content_type: "image/png")
alexis.save

pierreyves = User.new(email:"pierreyves@deskharmony.com", password: "coucou", first_name: "Pierre-Yves", last_name: "Le Guennec", job_title: "Data engineer", nickname: "Pierre-Yves" )
pierreyves_file = URI.open('https://res.cloudinary.com/dvarz39fw/image/upload/v1711196374/pierre-yves_vdzz70.jpg')
pierreyves.photo.attach(io: pierreyves_file, filename: "alexis.png", content_type: "image/png")
pierreyves.save

puts "users created"

puts "creating levels"


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
<rect x='611.596' y='120' width='83.7268' height='59.2482' rx='8'' fill='#D9D9D9' data-bureau='17' data-action='click->deskconnect#book'/>
<rect x='642.206' y='50' width='28.2134' height='27.0086' rx='8' ' fill='#D9D9D9'/>
<rect x='700.725' y='120' width='83.7268' height='59.2482' rx='8' ' fill='#D9D9D9' data-bureau='18' data-action='click->deskconnect#book'/>
<rect x='731.334' y='50' width='28.2134' height='27.0086' rx='8' ' fill='#D9D9D9'/>
<rect x='789.853' y='120' width='83.7268' height='59.2482' rx='8' ' fill='#D9D9D9' data-bureau='19' data-action='click->deskconnect#book'/>
<rect x='820.463' y='50' width='28.2134' height='27.0086' rx='8' ' fill='#D9D9D9'/>
<rect x='551.876' y='271.789' width='190.861' height='11.2854'  fill='#D9D9D9'/>
<rect x='811.159' y='274.61' width='120' height='8.46402'  fill='#D9D9D9'/>
<foreignObject x='90.0288' y='49.8437' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='1' data-position='right' > 1 </div>
</foreignObject>

<foreignObject x='152.149' y='49.8437' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='2' data-position='right'> 2</div>
</foreignObject>

<foreignObject x='90.0288' y='151.412' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='3' data-position='right'> 3</div>
</foreignObject>

<foreignObject x='152.149' y='151.412' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='4' data-position='right'>4 </div>
</foreignObject>

<foreignObject x='90.0288' y='252.98' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='5' data-position='right'>5 </div>
</foreignObject>

<foreignObject x='152.149' y='252.98' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='6' data-position='right'>6 </div>
</foreignObject>

<foreignObject x='90.0288' y='354.548' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='7' data-position='bottom'> 7</div>
</foreignObject>

<foreignObject x='152.149' y='354.548' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='8' data-position='bottom'>8 </div>
</foreignObject>

<foreignObject x='349.312' y='49.8437' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='9' data-position='right'> 9</div>
</foreignObject>

<foreignObject x='411.431' y='49.8437' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='10' data-position='right'> 10</div>
</foreignObject>

<foreignObject x='349.312' y='151.412' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='11' data-position='right'>11 </div>
</foreignObject>

<foreignObject x='411.431' y='151.412' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='12' data-position='right'> 12</div>
</foreignObject>

<foreignObject x='349.312' y='252.98' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='13' data-position='right'>13 </div>
</foreignObject>

<foreignObject x='411.431' y='252.98' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='14' data-position='right'>14 </div>
</foreignObject>

<foreignObject x='349.312' y='354.548' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='15' data-position='bottom'>15 </div>
</foreignObject>

<foreignObject x='411.431' y='354.548' width='56.7181' height='87.4615'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='16' data-position='bottom'>16 </div>
</foreignObject>

<foreignObject x='611.596' y='120' width='83.7268' height='59.2482'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='17' data-position='left'> 17</div>
</foreignObject>

<foreignObject x='700.725' y='120' width='83.7268' height='59.2482'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='18' data-position='left'>18 </div>
</foreignObject>
<foreignObject x='789.853' y='120' width='83.7268' height='59.2482'>
    <div class='svginsertion' data-action='click->menu-contextuel#display' data-bureau='19' data-position='left' > 19</div>
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


puts "levels created"

puts "creating desks"

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

puts "desks created"

puts "creating appointments"

Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 10).id, start_at: "2024-01-15")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-01-16")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 24).id, start_at: "2024-01-27")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 19).id, start_at: "2024-01-28")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-01-29")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-02-05")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 6).id, start_at: "2024-02-06")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 10).id, start_at: "2024-02-07")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 20).id, start_at: "2024-02-14")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-02-15")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 3).id, start_at: "2024-02-16")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 3).id, start_at: "2024-02-19")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 8).id, start_at: "2024-02-20")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 6).id, start_at: "2024-02-21")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 6).id, start_at: "2024-02-26")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 17).id, start_at: "2024-02-27")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-02-29")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 10).id, start_at: "2024-03-04")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 18).id, start_at: "2024-03-05")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 13).id, start_at: "2024-03-06")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 25).id, start_at: "2024-03-11")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 4).id, start_at: "2024-03-12")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 3).id, start_at: "2024-03-14")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-03-19")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 2).id, start_at: "2024-03-20")
Appointment.create!(user_id: laura.id, desk_id: Desk.find_by(name: 23).id, start_at: "2024-03-22")

puts " appointment created"

Chatroom.create!(name: 1);

data_team = Team.create!(name: "Equipe Data", description: "Equipe Data de choc")

puts " teams users created"

team_laura = TeamUser.create!(team_id: data_team.id, user_id: laura.id)
team_fabien = TeamUser.create!(team_id: data_team.id, user_id: fabien.id)
team_ingrid = TeamUser.create!(team_id: data_team.id, user_id: ingrid.id)
team_ines = TeamUser.create!(team_id: data_team.id, user_id: ines.id)
team_seb = TeamUser.create!(team_id: data_team.id, user_id: seb.id)
team_alex = TeamUser.create!(team_id: data_team.id, user_id: alex.id)
team_florine= TeamUser.create!(team_id: data_team.id, user_id: florine.id)
team_charlie = TeamUser.create!(team_id: data_team.id, user_id: charlie.id)
team_maelie = TeamUser.create!(team_id: data_team.id, user_id: maelie.id)
team_gwendal = TeamUser.create!(team_id: data_team.id, user_id: gwendal.id)
team_julien = TeamUser.create!(team_id: data_team.id, user_id: julien.id)
team_kevin = TeamUser.create!(team_id: data_team.id, user_id: kevin.id)
team_alexis = TeamUser.create!(team_id: data_team.id, user_id: alexis.id)
team_pierreyves = TeamUser.create!(team_id: data_team.id, user_id: pierreyves.id)

puts "seed created"
