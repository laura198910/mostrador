json.extract! producto, :id, :nombre, :descripcion, :categoria_id, :precio, :created_at, :updated_at
json.url producto_url(producto, format: :json)