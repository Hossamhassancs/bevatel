FactoryBot.define do
    factory :student do
      name { Faker::Name.name }
      school_id nil
    end
end
  