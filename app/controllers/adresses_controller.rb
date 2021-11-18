class AdressesController < ApplicationController
    before_action :find_adress, except: %i[create index]

	# GET /adress
	def index
		@finalResult = []
		@adresses = Adress.all
		@adresses.each do |adress|
			@finalResult.push(adress.json)
		end
		render json: @finalResult, status: :ok
	end

	# GET /adress/{id}
	def show
		render json: @adress, status: :ok
	end

	# POST /adress
	def create
		@adress = Adress.new(adress_params)
		if @adress.save
			render json: @adress, status: :created
		else
			render json: { errors: @adress.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# PUT /adress/{id}
	def update
		if @adress.update(adress_params)
			render json: @adress, status: :ok
		else
			render json: { errors: @adress.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

	def find_adress
		@adress = Adress.find(params[:_id]).json
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Adress not found' }, status: :not_found
	end

	def adress_params
		params.permit( :cep, :logradouro, :complement, :district, :city, :uf, :ibge_code, :municipe_id )
	end
end
