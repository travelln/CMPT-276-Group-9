require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "My Canada App"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | My Canada App"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | My Canada App"
  end

  test "should get population" do
    get :population
    assert_response :success
    assert_select "title", "Population | My Canada App"
  end

  test "should get pollution" do
    get :pollution
    assert_response :success
    assert_select "title", "Pollution | My Canada App"
  end

end
