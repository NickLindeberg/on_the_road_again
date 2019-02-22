[![Waffle.io - Columns and their card count](https://badge.waffle.io/NickLindeberg/on_the_road_again.svg?columns=all)](https://waffle.io/NickLindeberg/on_the_road_again)

## On The Road Again

OTRA is an app designed to help musicians and other touring performers plan over the road tours.  

After years of playing music in Denver and the surround states, I realized that as musicians, we have no way of tracking how profitable it is/isn’t to go on tour.  All of our contacts and experiences have to be remembered.  OTRA gives performers a way to track their performances to help them plan tours in the future.  With OTRA you can search for venues, track ticket/merchandise sales and keep track of your past and future tours.  

By giving musicians an easy way to track their sales and venue information, it gives them the information to decide where to plan their next tour.  

OTRA is for anyone that is on the road performing.  

### APIs 

- Songkick for venue information
- Google Maps

### Dependencies 

This project uses the following:

 - Ruby 2.4.1
 - Rails 5.2.2
 - omniauth-google-oauth2
 - rspec-rails
 - figaro
 
### Install 

 - Clone the repo:
 
 git@github.com:NickLindeberg/on_the_road_again.git
 
 - Run:
 
 bundle install
 bundle update
 
 - Setup the database:
 
 rake db:{drop,create,migrate,seed}
 
 ### Testing
 
 Run the tests by running rspec into your command line.
 
 ### Team
 
 [Jimmy Smith](https://github.com/JSmith23) 
 
 [Nick Lindeberg](https://github.com/NickLindeberg)
 
 [Silvestre Cuellar](https://github.com/SiCuellar)

