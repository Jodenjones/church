require 'test_helper'

class CaixasControllerTest < ActionController::TestCase
  setup do
    @caixa = caixas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caixas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caixa" do
    assert_difference('Caixa.count') do
      post :create, caixa: { name: @caixa.name }
    end

    assert_redirected_to caixa_path(assigns(:caixa))
  end

  test "should show caixa" do
    get :show, id: @caixa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caixa
    assert_response :success
  end

  test "should update caixa" do
    patch :update, id: @caixa, caixa: { name: @caixa.name }
    assert_redirected_to caixa_path(assigns(:caixa))
  end

  test "should destroy caixa" do
    assert_difference('Caixa.count', -1) do
      delete :destroy, id: @caixa
    end

    assert_redirected_to caixas_path
  end
end
