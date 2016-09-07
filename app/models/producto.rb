class Producto < ActiveRecord::Base
	has_many :productos

	validates  :nombre, :descripcion, :categoria_id, :precio, presence:true
end
