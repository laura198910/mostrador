class AddImagenproductoToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :imagenproducto, :string
  end
end
