class Citizen < ApplicationRecord
  has_one :address
  mount_uploader :photo, ImageUploader
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status, presence: true

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
      address: self.address,
      created_at: self.created_at,
      updated_at: self.updated_at,
    }
  end
end