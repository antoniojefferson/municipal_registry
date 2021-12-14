class Municipe < ApplicationRecord
    has_many :adresses, foreign_key: "municipe_id"
    mount_uploader :photo, ImageUploader
    accepts_nested_attributes_for :adresses, allow_destroy: true

    def json
      {
        id: self.id,
        full_name: self.full_name,
        cpf: self.cpf,
        cns: self.cns,
        email: self.email,
        birth_date: self.birth_date.strftime('%d/%m/%Y'),
        phone: self.phone,
        photo: self.photo,
        status: self.status,
        adress: self.adresses,
        created_at: self.created_at,
        updated_at: self.updated_at,
      }
    end
end
