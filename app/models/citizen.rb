class Citizen < ApplicationRecord
  has_one :address
  mount_uploader :photo, ImageUploader
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, presence: true
end