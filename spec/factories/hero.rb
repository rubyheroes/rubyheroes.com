FactoryGirl.define do
  factory :hero do
    name { Faker::Name.name }
    year { (2009..Date.today.year).to_a.sample }
  end
end
