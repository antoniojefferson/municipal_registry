class AddressSerializer < ActiveModel::Serializer
  attributes :id, :cep, :logradouro, :complement, :district, :city, :uf, :ibge_code
end
