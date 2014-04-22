class VisitantesController < ApplicationController
	def new
		@propietario = Propietario.new
		render 'visitantes/new'
	end
end