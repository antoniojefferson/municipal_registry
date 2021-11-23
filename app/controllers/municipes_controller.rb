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
		puts '---------------------------------------------------'
		puts params
		puts '---------------------------------------------------'
		puts params[:cep]
		@municipe = Municipe.new({
			full_name: municipe_params[:full_name],
			cpf: municipe_params[:cpf],
			cns: municipe_params[:cns],
			email: municipe_params[:email],
			birth_date: municipe_params[:birth_date],
			phone: municipe_params[:phone],
			photo: municipe_params[:photo],
			status: municipe_params[:status]
		})
		if @municipe.save
			@adress = Adress.new({
				cep: municipe_params[:cep],
				logradouro: municipe_params[:logradouro],
				complement: municipe_params[:complement],
				district: municipe_params[:district],
				city: municipe_params[:city],
				uf: municipe_params[:uf],
				ibge_code: municipe_params[:ibge_code]
			})
			@adress.municipe = @municipe
			@adress.save

			render json: @municipe, status: :created
		else
			render json: { errors: @municipe.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# PUT /municipe/{id}
	def update
		if @municipe.update({
			full_name: municipe_params[:full_name],
			cpf: municipe_params[:cpf],
			cns: municipe_params[:cns],
			email: municipe_params[:email],
			birth_date: municipe_params[:birth_date],
			phone: municipe_params[:phone],
			status: municipe_params[:status]
		})
			if municipe_params[:photo]
				@municipe.update(photo: municipe_params[:photo])
			end

			@municipe.adress.update({
				cep: municipe_params[:cep],
				logradouro: municipe_params[:logradouro],
				complement: municipe_params[:complement],
				district: municipe_params[:district],
				city: municipe_params[:city],
				uf: municipe_params[:uf],
				ibge_code: municipe_params[:ibge_code]
			})
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
		params.permit( :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status, :cep, :logradouro, :complement, :district, :city, :uf, :ibge_code )
	end
end
