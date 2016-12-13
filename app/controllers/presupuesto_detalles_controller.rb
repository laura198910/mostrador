class PresupuestoDetallesController < ApplicationController
   skip_before_filter :authenticate_usuario!
  before_action :set_presupuesto_detalle, only: [:show, :edit, :update, :destroy]

  # GET /presupuesto_detalles
  # GET /presupuesto_detalles.json
  def index
    @presupuesto_detalles = PresupuestoDetalle.all
  end

  # GET /presupuesto_detalles/1
  # GET /presupuesto_detalles/1.json
  def show
  end

  # GET /presupuesto_detalles/new
  def new
    @presupuesto_detalle = PresupuestoDetalle.new
  end

  # GET /presupuesto_detalles/1/edit
  def edit
  end

  # POST /presupuesto_detalles
  # POST /presupuesto_detalles.json
  def create
    @presupuesto_detalle = PresupuestoDetalle.new(presupuesto_detalle_params)

    respond_to do |format|
      if @presupuesto_detalle.save
        format.html { redirect_to @presupuesto_detalle, notice: 'Presupuesto detalle was successfully created.' }
        format.json { render :show, status: :created, location: @presupuesto_detalle }
      else
        format.html { render :new }
        format.json { render json: @presupuesto_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presupuesto_detalles/1
  # PATCH/PUT /presupuesto_detalles/1.json
  def update
    respond_to do |format|
      if @presupuesto_detalle.update(presupuesto_detalle_params)
        format.html { redirect_to @presupuesto_detalle, notice: 'Presupuesto detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: @presupuesto_detalle }
      else
        format.html { render :edit }
        format.json { render json: @presupuesto_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presupuesto_detalles/1
  # DELETE /presupuesto_detalles/1.json
  def destroy
    @presupuesto_detalle.destroy
    respond_to do |format|
      format.html { redirect_to presupuesto_detalles_url, notice: 'Presupuesto detalle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presupuesto_detalle
      @presupuesto_detalle = PresupuestoDetalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presupuesto_detalle_params
      params.require(:presupuesto_detalle).permit(:presupuesto_detalle_id, :cantidad)
    end
end
