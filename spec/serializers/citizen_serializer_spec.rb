require 'rails_helper'

RSpec.describe CitizenSerializer, type: :serializer do
  let(:citizen) { create :citizen }
  let(:serializer) { described_class.new citizen }

  it { expect(described_class.ancestors).to include ActiveModel::Serializer }

  describe 'atributos serializados' do
    let(:keys) do
      %w[ id full_name cpf cns email birth_date phone photo status address ]
    end

    subject { JSON.parse serializer.to_json }

    it { is_expected.to include(*keys) }
    it { expect(subject.count).to eq keys.size }
  end
end
