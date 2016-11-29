class AddPresupuestoIdToPresupuestoDetalle < ActiveRecord::Migration
  def change
    add_column :presupuesto_detalles, :presupuesto_id, :integer
  end
end
