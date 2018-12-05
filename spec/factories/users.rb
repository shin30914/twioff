FactoryBot.define do
  factory :user do
    email "123-twitter@example.com"
    uid "123"
    provider "twitter"
    name "anonymous"
    nickname "@anonymous"
    # confirmed_at Time.now
  end
end