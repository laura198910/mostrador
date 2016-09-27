class Categorium < ActiveRecord::Base
	validates :nombre, :detalle, presence:true
	has_many :productos
end
