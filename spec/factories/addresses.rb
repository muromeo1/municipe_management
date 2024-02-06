FactoryBot.define do
  factory :address do
    municipe

    cep { Faker::Address.zip }
    street { Faker::Address.street_address }
    complement { nil }
    neighborhood { 'Patriarca' }
    city { Faker::Address.city }
    state { Faker::Address.state }
    ibge_code { nil }
  end
end
