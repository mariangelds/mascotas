class Contacto < ActiveRecord::Base
has_no_table

column :nombre, :string
column :email, :string
column :mensaje, :string

validates_presence_of :nombre, message: "El nombre no puede ser blanco"
validates_presence_of :email
validates_presence_of :mensaje
validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
validates_length_of :mensaje, :maximum => 500

def actualizar_hoja_calculo
	connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"]) 
    ss = connection.spreadsheet_by_title('Contactos Mascotas')
    if ss.nil? 
       ss = connection.create_spreadsheet('Contactos Mascotas') 
    end 
    ws = ss.worksheets[0] 
    last_row = 1 + ws.num_rows 
    ws[last_row, 1] = Time.new 
    ws[last_row, 2] = self.nombre
    ws[last_row, 3] = self.email 
    ws[last_row, 4] = self.mensaje
    ws.save 
end 


end