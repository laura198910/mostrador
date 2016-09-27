class Presupuesto < ActiveRecord::Base
		has_many :presupuesto_detalles
		validates :fecha, presence:true
end
