class HomeController < ApplicationController
  def index
  	@productos = Producto.all
  end
def show
	@presupuesto = Presupuesto.includes(:presupuesto_detalles).find(params[:id])
	
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