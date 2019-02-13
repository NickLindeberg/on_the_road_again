FactoryBot.define do
  factory :venue do
    name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    website { "MyString" }
    phone { "MyText" }
    capacity { "MyString" }
    zip { "MyString" }
    lat { "MyString" }
    lng { "MyString" }
    songkick_id { 1 }
  end
end
