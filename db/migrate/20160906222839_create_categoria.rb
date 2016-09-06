class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nombre
      t.text :detalle

      t.timestamps null: false
    end
  end
end
