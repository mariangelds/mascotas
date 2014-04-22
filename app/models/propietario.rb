class Propietario

	def nombre 
		nombre = "Javier"
	end

	def fechacumple
		fechacumple = Date.new(1992,07,17)
	end

	def conteo
		hoy = Date.today
		fechadia = Date.new(hoy.year,fechacumple.month,fechacumple.day)
		if fechadia > hoy
			conteo = (fechadia-hoy).to_i
		else
			conteo = (fechadia.next_year - hoy).to_i
		end
	end
end