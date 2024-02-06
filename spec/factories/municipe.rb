FactoryBot.define do
  factory :municipe do
    full_name { Faker::Name.name }
    cpf { CPF.generate }
    cns { '192861210770009' }
    email { Faker::Internet.email(name: full_name) }
    birthdate { Faker::Date.birthday }
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
    active { true }
  end
end
