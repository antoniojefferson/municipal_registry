class MunicipesController < ApplicationController
  before_action :find_municipe, except: %i[create index]

	# GET /municipe
	def index
		@finalResult = []
		@municipes = Municipe.all
		@municipes.each do |municipe|
			@finalResult.push(municipe.json)
		end
		render json: @finalResult, status: :ok
	end

	# GET /municipe/{id}
	def show
		render json: @municipe, status: :ok
	end

	# POST /municipe
	def create
    
		@municipe = Municipe.new(municipe_params)
		if @municipe.save

			render json: @municipe, status: :created
		else
			render json: { errors: @municipe.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# PUT /municipe/{id}
	def update
		if @municipe.update(municipe_params)
			render json: @municipe, status: :ok
		else
			render json: { errors: @municipe.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

	def find_municipe
		@municipe = Municipe.find(params[:_id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Municipe not found' }, status: :not_found
	end

	def municipe_params
		params.permit(
      :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status,
      adresses_attributes: [ :id, :cep, :logradouro, :complement, :district, :city, :uf, :ibge_code ]
    )
	end
end
