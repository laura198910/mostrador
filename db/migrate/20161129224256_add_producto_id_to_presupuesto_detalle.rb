class AddProductoIdToPresupuestoDetalle < ActiveRecord::Migration
  def change

  	add_column :presupuesto_detalles, :producto_id, :integer
  end
end
