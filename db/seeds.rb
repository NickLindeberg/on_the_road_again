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

Event.create!(name: "Baffling Belligerent Bodacious Bovines", show_date: "2018-02-01", show_time: "18:00", venue_id: 1, tour_id: 1, event_profit: 500, travel_cost: 200)
Event.create!(name: "Rambunctious Robust Rhuberry Rhinos", show_date: "2020-02-01", show_time: "19:00", venue_id: 1, tour_id: 1, event_profit: 600, travel_cost: 375)
Event.create!(name: "Abrasive Absusive Abundant Asinine Anacondas", show_date: "2019-05-01", show_time: "23:00", venue_id: 2, tour_id: 2, event_profit: 700, travel_cost: 900)
Event.create!(name: "Fabulous Fake Fallacious Fatty Flamingos", show_date: "2019-09-22", show_time: "22:00", venue_id: 3, tour_id: 3, event_profit: 900, travel_cost: 496)
Event.create!(name: "Unruly Unconstituional Ultra Underweight Unicorns", show_date: "2019-05-16", show_time: "21:00", venue_id: 4, tour_id: 1, event_profit: 1000, travel_cost: 770)
Event.create!(name: "Dirty Diabetic Disturbed Drunken Dolphins ", show_date: "2017-05-16", show_time: "15:00", venue_id: 1, tour_id: 1, event_profit: 200, travel_cost: 54)
