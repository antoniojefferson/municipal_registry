class Adress < ApplicationRecord
  belongs_to :municipe, optional: true

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
			municipe: self.municipes,
		}
	end
end
