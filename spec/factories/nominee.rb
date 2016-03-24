FactoryGirl.define do
  factory :nominee do
    name { Faker::Name.name }
    github_username { Faker::Internet.user_name }

    trait :with_nomination do
      after(:create) do |nominee|
        nominee.nominations << create(:nomination)
      end
    end
  end
end
