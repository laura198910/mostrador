class Categorium < ActiveRecord::Base
	validates :nombre, :detalle, presence:true
end
