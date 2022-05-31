FactoryBot.define do
  factory :address do
    cep { FFaker::AddressBR.zip_code }
    logradouro { FFaker::AddressBR.street }
    complement { "Teste" }
    district { 'Centro' }
    city { FFaker::AddressBR.city }
    uf { FFaker::AddressBR.state_abbr }
    ibge_code { 1234 }
  end
end