FactoryBot.define do
  factory :artist do
    name { "Mean Machine" }
    token { "tomhanks1234" }
    email { "whereyou@willson.com" }
    google_client_id { "google_client" }
    refresh_token { "refresh_token" }
  end
end
