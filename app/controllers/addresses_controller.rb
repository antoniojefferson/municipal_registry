class AddressesController < ApplicationController
    before_action :find_address, except: %i[create index]

	# GET /address
	def index
		@finalResult = []
		@addresses = Address.all
		@addresses.each do |address|
			@finalResult.push(address.json)
		end
		render json: @finalResult, status: :ok
	end

	# GET /address/{id}
	def show
		render json: @address, status: :ok
	end

	# POST /address
	def create
		@address = Address.new(address_params)
		if @address.save
			render json: @address, status: :created
		else
			render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# PUT /address/{id}
	def update
		if @address.update(address_params)
			render json: @address, status: :ok
		else
			render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

	def find_address
		@address = Address.find(params[:_id]).json
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Address not found' }, status: :not_found
	end

	def address_params
		params.permit( :cep, :logradouro, :complement, :district, :city, :uf, :ibge_code, :municipe_id )
	end
end
