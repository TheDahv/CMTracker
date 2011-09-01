require 'test_helper'

class ClassroomsControllerTest < ActionController::TestCase
  setup do
    @classroom = classrooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom" do
    assert_difference('Classroom.count') do
      post :create, :classroom => @classroom.attributes
    end

    assert_redirected_to classroom_path(assigns(:classroom))
  end

  test "should show classroom" do
    get :show, :id => @classroom.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @classroom.to_param
    assert_response :success
  end

  test "should update classroom" do
    put :update, :id => @classroom.to_param, :classroom => @classroom.attributes
    assert_redirected_to classroom_path(assigns(:classroom))
  end

  test "should destroy classroom" do
    assert_difference('Classroom.count', -1) do
      delete :destroy, :id => @classroom.to_param
    end

    assert_redirected_to classrooms_path
  end
end
