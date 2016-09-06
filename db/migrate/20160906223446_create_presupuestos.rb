class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.integer :presupuesto_id
      t.date :fecha

      t.timestamps null: false
    end
  end
end
