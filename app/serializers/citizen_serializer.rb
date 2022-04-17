class CitizenSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status

  has_one :address, serializer: AddressSerializer
end
