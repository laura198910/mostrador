class HomeController < ApplicationController
  skip_before_filter :authenticate_usuario!
  def index
  	@productos = Producto.all
  end
def show
  if
	@presupuesto = Presupuesto.includes(:presupuesto_detalles).find(params[:id])
	
  end
 end
end
