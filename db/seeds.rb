# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create!(name: Faker::Music::RockBand.name, email: "silver_adventure@google.com", google_token: "fsnjksfnjkdfs", google_client_id: "fjnfknsjkdnsdkfsd")
Artist.create!(name: Faker::Music::RockBand.name, email: "ungodly_rapture@google.com", google_token: "fsnjksfnjkdfs", google_client_id: "fjnfknsjkdnsdkfsd")
Artist.create!(name: Faker::Music::RockBand.name, email: "rigid_spinal@google.com", google_token: "fsnjksfnjkdfs", google_client_id: "fjnfknsjkdnsdkfsd")

Tour.create!(name: "One In A Million Tour", artist_id: 1)
Tour.create!(name: "On The Run Tour", artist_id: 2)
Tour.create!(name: "In My Feelings Tour", artist_id: 3)

Venue.create!(name: "The Ogden", address: "935 E Colfax Ave", city: "Denver", state: "CO", website: "https://wwww.ogdentheatre.com", phone: "303-832-1874", capacity: 1600,  zip: 80218, lat: 39, lng: 104, songkick_id:1)
Venue.create!(name: "Fillmore Auditorium", address: "1510 N Clarkson St", city: "Denver", state: "CO", website: "wwww.fillmoreauditorium.org", phone: "303-837-0360", capacity: 3900,  zip: 80218, lat: 37, lng: 122, songkick_id:2)
Venue.create!(name: "Ellie Caulkins Opera House at Denver Performing Arts Complex", address: "1385 Curtis Street", city: "Denver", state: "CO", website: "https://www.denvercenter.org", phone: "303-893-4000", capacity: 2225,  zip: 80204, lat: 39, lng: 104, songkick_id:3)
Venue.create!(name: "Bellco Theatre", address: "700 14th St", city: "Denver", state: "CO", website: "www.bellcotheare.com", phone: "303-228-8260", capacity: 5000,  zip: 80202, lat: 39, lng: 104, songkick_id:4)

Event.create!(name: "Bone Brushers", show_time: "2018-02-01", venue_id: 1, tour_id: 1)
Event.create!(name: "Renegades", show_time: "2019-05-01", venue_id: 2, tour_id: 2)
Event.create!(name: "Rushers", show_time: "2019-09-22", venue_id: 3, tour_id: 3)
Event.create!(name: "Flatulating Unicorn", show_time: "2019-05-16", venue_id: 4, tour_id: 1)
