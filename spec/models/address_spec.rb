require 'rails_helper'
require 'spec_helper'

describe Address do

  context 'relação' do
    it { is_expected.to belong_to(:citizen) }
  end

  context 'validações' do
    it { is_expected.to validate_presence_of :cep }
    it { is_expected.to validate_presence_of :logradouro }
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :uf }

  end
end
