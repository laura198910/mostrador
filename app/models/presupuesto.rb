class Presupuesto < ActiveRecord::Base
		has_many :presupuesto_detalles
		has_many :producto, through: :presupuesto_detalles
		validates :fecha, presence:true
end
