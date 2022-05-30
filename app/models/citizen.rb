class Citizen < ApplicationRecord
  has_one :address, :dependent => :destroy
  mount_uploader :photo, ImageUploader
  accepts_nested_attributes_for :address, allow_destroy: true
  validates :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, presence: true

  validate :unique_cpf, if: proc { |citizen| citizen.cpf.present? }
  validate :unique_cns, if: proc { |citizen| citizen.cns.present? }
  validate :unique_email, if: proc { |citizen| citizen.email.present? }

  def unique_cpf
    citizen = Citizen.find_by(cpf: self.cpf)
    return unless citizen.present?
    return if self == citizen
    mensagem = I18n.t('activerecord.errors.models.citizen.attributes.cpf.unique')
    errors.add(:base, mensagem) if citizen.present?
  end

  def unique_cns
    citizen = Citizen.find_by(cns: self.cns)
    return unless citizen.present?
    return if self == citizen
    mensagem = I18n.t('activerecord.errors.models.citizen.attributes.cns.unique')
    errors.add(:base, mensagem) if citizen.present?
  end

  def unique_email
    citizen = Citizen.find_by(email: self.email)
    return unless citizen.present?
    return if self == citizen
    mensagem = I18n.t('activerecord.errors.models.citizen.attributes.email.unique')
    errors.add(:base, mensagem) if citizen.present?
  end
end