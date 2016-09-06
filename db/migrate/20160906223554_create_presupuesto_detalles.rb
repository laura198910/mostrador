class CreatePresupuestoDetalles < ActiveRecord::Migration
  def change
    create_table :presupuesto_detalles do |t|
      t.integer :presupuesto_detalle_id
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
