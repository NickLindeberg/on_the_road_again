FactoryBot.define do
  factory :venue do
    name { "Silver's Palice" }
    address { "1135 13th Street" }
    city { "Los Angeles" }
    state { "CA" }
    website { "http://www.foxtheatre.com/" }
    phone { "(313) 471-6611" }
    capacity { 5174 }
    zip { 79912 }
    lat { 34.0862 }
    lng { -118.376 }
    songkick_id { 17835 }
  end
end
