require 'rails_helper'
require 'spec_helper'

describe Citizen do

  context 'relação' do
    it { is_expected.to have_one(:address).dependent(:destroy) }
  end

  context 'validações' do
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_presence_of :cpf }
    it { is_expected.to validate_presence_of :cns }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :birth_date }
    it { is_expected.to validate_presence_of :phone }

    context 'quando tem citizen com cpf' do
      let!(:citizen) { create(:citizen) }

      subject { described_class.new cpf: cpf }

      context 'quando o CPF já existe' do
        let!(:cpf) { citizen.cpf }

        it 'retorna erro' do
          subject.valid?

          expect(subject.errors[:cpf]).to contain_exactly I18n.t('activerecord.errors.models.citizen.attributes.cpf.unique')
        end
      end

      context 'quando o CPF não exite existe' do
        let(:cpf) { '98636771080' }

        it 'não retorna erro' do
          subject.valid?

          expect(subject.errors[:cpf]).to be_empty
        end
      end

      context 'quando o CPF está vazio' do
        let(:cpf) { '' }

        it 'retorna erro' do
          subject.valid?

          expect(subject.errors[:cpf]).to contain_exactly 'não pode ficar em branco'
        end
      end
    end

    context 'quando tem citizen com cns' do
      let!(:citizen) { create(:citizen) }

      subject { described_class.new cns: cns }

      context 'quando o CNS já existe' do
        let!(:cns) { citizen.cns }

        it 'retorna erro' do
          
          subject.valid?

          expect(subject.errors[:cns]).to contain_exactly I18n.t('activerecord.errors.models.citizen.attributes.cns.unique')
        end
      end

      context 'quando o CNS não existe' do
        let(:cns) { '164162882070006' }

        it 'não retorna erro' do
          subject.valid?

          expect(subject.errors[:cns]).to be_empty
        end
      end

      context 'quando o CNS é vazio' do
        let(:cns) { '' }

        it 'retorna erro' do
          subject.valid?

          expect(subject.errors[:cns]).to contain_exactly 'não pode ficar em branco'
        end
      end
    end

    context 'quando tem citizen com email' do
      let!(:citizen) { create(:citizen) }

      subject { described_class.new email: email }

      context 'quando o email já existe' do
        let!(:email) { citizen.email }

        it 'retorna erro' do
          
          subject.valid?

          expect(subject.errors[:email]).to contain_exactly I18n.t('activerecord.errors.models.citizen.attributes.email.unique')
        end
      end

      context 'quando o email não existe' do
        let(:email) { 'marcos.souza@gmail.com' }

        it 'não retorna erro' do
          subject.valid?

          expect(subject.errors[:email]).to be_empty
        end
      end

      context 'when email format is valid' do
        let(:email) { 'email@email.com' }

        it 'does not have error to email' do
          subject.valid?

          expect(subject.errors[:email]).to be_empty
        end
      end

      context 'when email format is invalid' do
        let(:email) { 'email@.com' }

        it 'has error to email' do
          subject.valid?

          expect(subject.errors[:email]).to contain_exactly I18n.t('activerecord.errors.models.citizen.attributes.email.invalid')
        end
      end

      context 'quando o email é vazio' do
        let(:email) { '' }

        it 'retorna erro' do
          subject.valid?

          expect(subject.errors[:email]).to include 'não pode ficar em branco'
        end
      end

    end

    describe 'nested_attributes' do
      it { is_expected.to accept_nested_attributes_for(:address) }
    end

  end
end
