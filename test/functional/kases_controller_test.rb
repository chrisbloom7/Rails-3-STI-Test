require 'test_helper'

class KasesControllerTest < ActionController::TestCase
  setup do
    @kase = kases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kase" do
    assert_difference('Kase.count') do
      post :create, :kase => @kase.attributes
    end

    assert_redirected_to kase_path(assigns(:kase))
  end

  test "should show kase" do
    get :show, :id => @kase.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kase.to_param
    assert_response :success
  end

  test "should update kase" do
    put :update, :id => @kase.to_param, :kase => @kase.attributes
    assert_redirected_to kase_path(assigns(:kase))
  end

  test "should destroy kase" do
    assert_difference('Kase.count', -1) do
      delete :destroy, :id => @kase.to_param
    end

    assert_redirected_to kases_path
  end
end
