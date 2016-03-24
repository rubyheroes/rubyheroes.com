FactoryGirl.define do
  factory :nominee do
    name "Julie Ann Lovelace"
    github_username "julie_ann_lovelace"

    trait :with_nomination do
      after(:create) do |nominee|
        nominee.nominations << create(:nomination)
      end
    end
  end
end
