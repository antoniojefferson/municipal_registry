require 'rails_helper'

RSpec.describe AddressSerializer, type: :serializer do
  let(:address) { create :address }
  let(:serializer) { described_class.new address }

  it { expect(described_class.ancestors).to include ActiveModel::Serializer }

  describe 'atributos serializados' do
    let(:keys) do
      %w[ id cep logradouro complement district city uf ibge_code ]
    end

    subject { JSON.parse serializer.to_json }
    
    it { is_expected.to include(*keys) }
    it { expect(subject.count).to eq keys.size }
  end
end
