class HomeController < ApplicationController
  def index
  	@productos = Producto.all
  end
def show
	@presupuesto = Presupuesto.includes(:presupuesto_detalles).find(params[:id])
	
end
def add

	#cookies.delete :presupuesto_detalle_id

	if cookies[:presupuesto_detalle_id]
		@presupuesto = Presupuesto.find ( cookies[:presupuesto_detalle_id])
	else
		@presupuesto = Presupuesto.new(fecha: Date.today)
	end

	puts params.inspect
	producto = Producto.find(params[:id])

	detalle = @presupuesto.presupuesto_detalles.where(producto_id: producto.id).first
	
	if detalle
		detalle.cantidad +=1
	else
		detalle = @presupuesto.presupuesto_detalles.build(cantidad: 1, producto_id: producto.id)
	end


	if @presupuesto.save
		cookies[:presupuesto_detalle_id] = @presupuesto.id
	else

	end

	redirect_to root_path

end
end

#<%= link_to 'Ver Presupuesto' home_path(@presupuesto)
# show.html.erb
#<h1> Mostrando presupuesto  </h1>
#<p> Fecha: <%= @presupuesto.fecha %> </p>
#<table>
#	<thead>
#		<tr>
#			<th>Producto</th>
#			<th>Imagen</th>
#			<th>Cantidad</th>
##			<th>Precio Unitario</th>
#			<th>Subtotal</th>
#		</tr>
#	</thead>
#	</tbody>	
#		<% @presupuesto.presupuesto_detalles.each do|detalle| %>  
#		<tr>
##
#			<td></td>
#			<td></td>
#			<td></td>
#			<td></td>
#			<td></td>
#		</tr>
#	</tbody>
#</table>