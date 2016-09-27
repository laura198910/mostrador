class PresupuestoDetalle < ActiveRecord::Base
	belongs_to :productos
	belongs_to :presupuestos
	validates :cantidad, presence:true
end
