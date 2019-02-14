FactoryBot.define do
  factory :artist do
    name { "Mean Machine" }
    google_token { "tomhanks1234" }
    email { "whereyou@willson.com" }
    google_client_id { "google_client" }
  end
end