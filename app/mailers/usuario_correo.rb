class UsuarioCorreo < ActionMailer::Base
  default from: "do-not-reply@example.com"

  def contacto_email(contacto)
  	#contacto.emael es el email del visitante
  	#OWNER_EMAIL email del propietario del site configurado con figaro
  	@contacto=contacto
  	mail(to: ENV["OWNER_EMAIL"],from: @contacto.email,:subject => "Contacto mascostas")
  end
end
