class ProductosController < ApplicationController
  skip_before_filter :authenticate_usuario!, only: [:add, :eliminar]
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  # GET /productos
  # GET /productos.json
  def index
      @productos = Producto.all
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

    # GET /productos/1
    # GET /productos/1.json
    def show
          
    end

    # GET /productos/new
    def new
      @producto = Producto.new
      @categoria= Categorium.all
    end

    # GET /productos/1/edit
    def edit
      #@producto = Producto.find(params[ :id]);
    end

    # POST /productos
    # POST /productos.json
    def create
      @producto = Producto.new(producto_params)

      respond_to do |format|
        if @producto.save
          format.html { redirect_to @producto, notice: 'Producto Creado.' }
          format.json { render :show, status: :created, location: @producto }
        else
          format.html { render :new }
          format.json { render json: @producto.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /productos/1
    # PATCH/PUT /productos/1.json
    def update
      respond_to do |format|
        if @producto.update(producto_params)
          format.html { redirect_to @producto, notice: 'Producto actualizado.' }
          format.json { render :show, status: :ok, location: @producto }
        else
          format.html { render :edit }
          format.json { render json: @producto.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /productos/1
    # DELETE /productos/1.json
    def destroy
      @producto.destroy
      respond_to do |format|
        format.html { redirect_to home_index_path, notice: 'Producto borrado.' }
        format.json { head :no_content }
        #redirect_to home_index_path
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_producto
        @producto = Producto.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def producto_params
        params.require(:producto).permit(:nombre, :descripcion, :categoria_id, :precio, :imagenproducto, :nombre)
      end
end