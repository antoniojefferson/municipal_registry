class Address < ApplicationRecord
  belongs_to :citizen
  validates :cep, :logradouro, :district, :city, :uf, presence: true

	def json
		{
			cep: self.cep,
			logradouro: self.logradouro,
			complement: self.complement,
			district: self.district,
			city: self.city,
			uf: self.uf,
			ibge_code: self.ibge_code,
			created_at: self.created_at,
			updated_at: self.updated_at,
			municipe: self.municipe,
		}
	end
end
