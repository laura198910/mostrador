require 'test_helper'

class PresupuestoDetallesControllerTest < ActionController::TestCase
  setup do
    @presupuesto_detalle = presupuesto_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presupuesto_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presupuesto_detalle" do
    assert_difference('PresupuestoDetalle.count') do
      post :create, presupuesto_detalle: { cantidad: @presupuesto_detalle.cantidad, presupuesto_detalle_id: @presupuesto_detalle.presupuesto_detalle_id }
    end

    assert_redirected_to presupuesto_detalle_path(assigns(:presupuesto_detalle))
  end

  test "should show presupuesto_detalle" do
    get :show, id: @presupuesto_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presupuesto_detalle
    assert_response :success
  end

  test "should update presupuesto_detalle" do
    patch :update, id: @presupuesto_detalle, presupuesto_detalle: { cantidad: @presupuesto_detalle.cantidad, presupuesto_detalle_id: @presupuesto_detalle.presupuesto_detalle_id }
    assert_redirected_to presupuesto_detalle_path(assigns(:presupuesto_detalle))
  end

  test "should destroy presupuesto_detalle" do
    assert_difference('PresupuestoDetalle.count', -1) do
      delete :destroy, id: @presupuesto_detalle
    end

    assert_redirected_to presupuesto_detalles_path
  end
end
