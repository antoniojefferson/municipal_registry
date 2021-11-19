class Municipe < ApplicationRecord
    has_many :adress, foreign_key: "municipe_id"
    mount_uploader :photo, ImageUploader

    def json
        {
            full_name: self.full_name,
            cpf: self.cpf,
            cns: self.cns,
            email: self.email,
            birth_date: self.birth_date.strftime('%d/%m/%Y'),
            phone: self.phone,
            photo: self.photo,
            status: self.status,
			created_at: self.created_at,
			updated_at: self.updated_at,
        }
    end
end
