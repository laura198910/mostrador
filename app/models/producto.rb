require 'carrierwave/orm/activerecord'
class Producto < ActiveRecord::Base
	belongs_to :categoria
	has_many :presupuesto_detalles

	validates  :nombre, :descripcion, :categoria_id, :precio, presence:true
	mount_uploader :imagenproducto, ImagenproductoUploader
end
