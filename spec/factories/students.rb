FactoryBot.define do
    factory :student do
      name { Faker::Name.name }
      school_id nil
      email {Faker::Internet.email}
      password {"12345678"}
    end
end
  