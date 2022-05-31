FactoryBot.define do
  factory :citizen do
    full_name { FFaker::NameBR.name }
    cpf { FFaker::IdentificationBR.cpf }
    cns { FFaker::Bank.card_number }
    email { FFaker::Internet.email }
    birth_date { Date.current }
    phone { FFaker::PhoneNumberBR.mobile_phone_number }
    photo { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/uploads/image.jpg'), 'image/jpeg') }
    status { false }
  end
end