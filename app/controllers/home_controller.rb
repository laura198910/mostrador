class HomeController < ApplicationController
  def index
  	@productos = Producto.all
  end
def show
	@presupuesto = Presupuesto.includes(:presupuesto_detalles).find(params[:id])
	
end
def add
	if cookies[:presupuesto_id]
       presupuesto_id = cookies[:presupuesto_id]# La cookies guarda el presupuesto id dentro de si mismo 
       @presupuesto = Presupuesto.find(presupuesto_id)
    else
       @presupuesto = Presupuesto.new(fecha: DateTime.now)
    end
    puts params.inspect
    producto = Producto.find(params[:id])
    detalle =  @presupuesto.presupuesto_detalles.where(producto_id: producto.id ).first
    if detalle
      detalle.cantidad +=1
    else
      @presupuesto.presupuesto_detalles.build(cantidad: 1, producto_id: producto.id)
    end
     
      puts detalle.inspect
      puts @presupuesto.inspect

    detalle.save if detalle
    if @presupuesto.save
      # setear la cookies
      cookies[:presupuesto_id] = @presupuesto.id
      msg = "Se ha agregado #{producto.nombre} correctamente "
      flash[:notice] =  msg
      #flash.now  Esto se usa para render 
    else
      msg = "No se ha guardado #{producto.nombre} correctamente "
      flash[:error] =  msg
    end
      #redirect_to presupuesto_path(@presupuesto)
      redirect_to home_index_path
 end

  def sumarProducto
    #cookies.delete :presupuesto_id
    if cookies[:presupuesto_id]
       presupuesto_id = cookies[:presupuesto_id]# La cookies guarda el presupuesto id dentro de si mismo 
       @presupuesto = Presupuesto.find(presupuesto_id)
    else
       @presupuesto = Presupuesto.new(fecha: DateTime.now)
    end
    puts params.inspect
    producto = Producto.find(params[:id])
    detalle =  @presupuesto.presupuesto_detalles.where(producto_id: producto.id ).first
    if detalle
      detalle.cantidad +=1
    else
      @presupuesto.presupuesto_detalles.build(cantidad: 1, producto_id: producto.id)
    end
     
      puts detalle.inspect
      puts @presupuesto.inspect

    detalle.save if detalle
    if @presupuesto.save
      # setear la cookies
      cookies[:presupuesto_id] = @presupuesto.id
      msg = "Se ha agregado #{producto.nombre} correctamente "
      flash[:notice] =  msg
      #flash.now  Esto se usa para render 
    else
      msg = "No se ha guardado #{producto.nombre} correctamente "
      flash[:error] =  msg
    end
      #redirect_to presupuesto_path(@presupuesto)
      redirect_to home_show_path
 end
  def sumar_carrito
  @sumar =  2

  end

def eliminar
   presupuesto_id = cookies[:presupuesto_id]
    @presupuesto = Presupuesto.find(presupuesto_id)

    producto = Producto.find(params[:id])
    detalle =  @presupuesto.presupuesto_detalles.where(producto_id: producto.id ).first
    if !detalle
      cookies.delete :presupuesto_id
    else
      detalle.cantidad -=  1
       #.destroy
    end
    if @presupuesto.save
       detalle.save
      msg = "Se ha eliminado #{producto.nombre} correctamente "
      flash[:notice] =  msg
      #flash.now  Esto se usa para render 
    else
      msg = "No se ha eliminado #{producto.nombre} correctamente "
      flash[:error] =  msg
    end
      #redirect_to presupuesto_path(@presupuesto)
      redirect_to home_show_path
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