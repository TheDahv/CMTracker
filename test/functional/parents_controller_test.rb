require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, :parent => @parent.attributes
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should show parent" do
    get :show, :id => @parent.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @parent.to_param
    assert_response :success
  end

  test "should update parent" do
    put :update, :id => @parent.to_param, :parent => @parent.attributes
    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete :destroy, :id => @parent.to_param
    end

    assert_redirected_to parents_path
  end
end
