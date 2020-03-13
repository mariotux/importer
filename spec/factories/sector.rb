FactoryBot.define do
  factory :sector do
    name { Faker::Name.name  }
    trait :parent do
      parent { :sector }
    end
  end
end
