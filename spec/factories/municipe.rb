FactoryBot.define do
  factory :municipe do
    full_name { Faker::Name.name }
    cpf { '74788787091' }
    cns { '192861210770009' }
    email { Faker::Internet.email(name:) }
    birthdate { Faker::Date.birthday }
    phone { Faker::PhoneNumber.cell_phone_number_with_country_code }
    photo { Faker::Internet.domain_name }
    active { true }
  end
end
