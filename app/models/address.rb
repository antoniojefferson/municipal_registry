class Address < ApplicationRecord
	belongs_to :citizen
	validates :cep, :logradouro, :district, :city, :uf, presence: true
end
