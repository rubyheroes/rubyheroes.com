FactoryGirl.define do
  factory :nominator do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
  end
end
