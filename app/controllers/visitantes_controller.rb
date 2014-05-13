class VisitantesController < ApplicationController
	def new
		#@propietario = Propietario.new
		#flash[:notice] = 'Bienvenido!'
		#flash[:alert] = 'Mi cumpleanos esta cerca.'

		@visitante = Visitante.new
		#render 'visitantes/new'
	end

	def create
		@visitante = Visitante.new(secure_params)
		if @visitante.valid?
			@visitante.subscribe
			flash[:notice] = "Registrado #{@visitante.email} en nuestra lista de correos"
			redirect_to root_path
		else
			render :new
		end

	end

	private
	def secure_params
		params.require(:visitante).permit(:email)
	end
end