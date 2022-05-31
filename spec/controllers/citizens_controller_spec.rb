require 'rails_helper'

RSpec.describe CitizensController, type: :controller do
  let!(:citizen) { create :citizen }
  let!(:address) { create :address, citizen_id: citizen.id }
  let(:citizen_valid) { build :citizen }
  let(:citizen_invalid) { build :citizen, id: citizen.id, cns: '', birth_date: Date.current.to_s }
  let(:result) do
    {
      id: citizen.id,
      full_name: citizen.full_name,
      cpf: citizen.cpf,
      cns: citizen.cns,
      email: citizen.email,
      birth_date: citizen.birth_date.to_s,
      phone: citizen.phone,
      photo: { "url" => citizen.photo.url },
      status: citizen.status,
      address: {
        id: address.id,
        cep: address.cep,
        logradouro: address.logradouro,
        complement: address.complement,
        district: address.district,
        city: address.city,
        uf: address.uf,
        ibge_code: address.ibge_code
      }.stringify_keys
    }.stringify_keys
  end
  
  describe 'GET #index' do

    context 'quando busca por todos os citizens' do
      before do
        get :index
      end

      it 'retorna status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'retorna todas chaves e valores no json' do
        expect(json.first).to eq result
      end
    end

  end

  describe 'GET #show' do

    context 'quando busca um citizen por um id existente' do
      
      before do
        get :show, params: { id: citizen.id }
      end

      it 'retorna status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'retorna todas chaves e valores no json' do
        expect(json).to eq result
      end
    end

    context 'quando busca um citizen por um id inexistente' do
      before do
        get :show, params: { id: 60 }
      end

      it 'retorna status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'retorna o json um json valido com a chave erro' do
        expect(json).not_to be_nil
        expect(json['error']).not_to be_nil
      end

      it 'retorna o erro "Cidadão não encontrado"' do
        expect(json['error']).to eq "Cidadão não encontrado"
      end
    end

  end

  describe 'POST #create' do
    let(:valid_params) { citizen_valid.attributes }
    let(:invalid_params) { citizen_invalid.attributes }

    context 'quando o citizen e valido' do
      before { post :create, params: valid_params }

      it 'retorna o citizin criado' do
        expect(json).not_to be_nil
        expect(json['errors']).to be_nil
      end

      it 'retorna status criado' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'quando o citizen e invalido' do
      before { post :create, params: invalid_params }

      it 'retorna erros na criação' do
        expect(json).not_to be_nil
        expect(json['errors']).not_to be_nil
      end

      it 'retorna status não processável' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'quando os dados de obrigatorios de address são nulos' do
      let(:citizen2) { build :citizen }
      let(:address1) { build :address, cep: '' }
      let(:address_params) do
        {
          "address_attributes[id]" => address1.id,
          "address_attributes[cep]" => address1.cep,
          "address_attributes[logradouro]" => address1.logradouro,
          "address_attributes[complement]" => address1.complement,
          "address_attributes[district]" => address1.district,
          "address_attributes[city]" => address1.city,
          "address_attributes[uf]" => address1.uf,
          "address_attributes[ibge_code]" => address1.ibge_code
        }
      end

      before { post :create, params: { **citizen2.attributes, **address_params} }

      it 'retorna erros na criação' do
        expect(json).not_to be_nil
        expect(json['errors']).not_to be_nil
      end

      it 'retorna status não processável' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    let(:valid_params) { citizen.attributes }
    let(:invalid_params) { citizen_invalid.attributes }

    context 'quando o citizen é valido' do
      before { put :update, params: valid_params }

      it 'retorna o citizin criado' do
        expect(json).not_to be_nil
        expect(json['errors']).to be_nil
      end

      it 'retorna status ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'quando o citizen e invalido' do
      before { put :update, params: invalid_params }

      it 'retorna erros no update' do
        expect(json).not_to be_nil
        expect(json['errors']).not_to be_nil
      end

      it 'retorna status não processável' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end