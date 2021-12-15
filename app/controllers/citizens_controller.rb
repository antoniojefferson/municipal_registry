class CitizensController < ApplicationController
  before_action :find_citizen, except: %i[create index]

	# GET /citizens
	def index
		@finalResult = []
		@citizens = Citizen.all
		@citizens.each do |citizen|
			@finalResult.push(citizen.json)
		end
		render json: @finalResult, status: :ok
	end

	# GET /citizen/{id}
	def show
		render json: @citizen, status: :ok
	end

	# POST /citizen
	def create
    
		@citizen = Citizen.new(citizen_params)
		if @citizen.save

			render json: @citizen, status: :created
		else
			render json: { errors: @citizen.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# PUT /citizen/{id}
	def update
		if @citizen.update(citizen_params)
			render json: @citizen, status: :ok
		else
			render json: { errors: @citizen.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

	def find_citizen
		@citizen = Citizen.find(params[:_id])
		rescue ActiveRecord::RecordNotFound
			render json: { errors: 'Citizen not found' }, status: :not_found
	end

	def citizen_params
		params.permit(
      :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status,
      addresses_attributes: [ :id, :cep, :logradouro, :complement, :district, :city, :uf, :ibge_code ]
    )
	end
end
