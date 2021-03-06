FactoryGirl.define do
    factory :user do
        email { Faker::Internet.email }
        password "testpass"
        password_confirmation "testpass"
        url { Faker::Internet.url }
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        bio { Faker::Hipster.paragraph }
    end
end
