require 'test_helper'

class DataControllerTest < ActionController::TestCase
  test "should get systems" do
    get :systems
    assert_response :success
  end

  test "should get subsystems" do
    get :subsystems
    assert_response :success
  end

  test "should get links" do
    get :links
    assert_response :success
  end

  test "should get detailed" do
    get :detailed
    assert_response :success
  end

end
