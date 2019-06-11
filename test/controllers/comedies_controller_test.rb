require 'test_helper'

class ComediesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comedy = comedies(:one)
  end

  test "should get index" do
    get comedies_url
    assert_response :success
  end

  test "should get new" do
    get new_comedy_url
    assert_response :success
  end

  test "should create comedy" do
    assert_difference('Comedy.count') do
      post comedies_url, params: { comedy: { body: @comedy.body, title: @comedy.title, user_id: @comedy.user_id } }
    end

    assert_redirected_to comedy_url(Comedy.last)
  end

  test "should show comedy" do
    get comedy_url(@comedy)
    assert_response :success
  end

  test "should get edit" do
    get edit_comedy_url(@comedy)
    assert_response :success
  end

  test "should update comedy" do
    patch comedy_url(@comedy), params: { comedy: { body: @comedy.body, title: @comedy.title, user_id: @comedy.user_id } }
    assert_redirected_to comedy_url(@comedy)
  end

  test "should destroy comedy" do
    assert_difference('Comedy.count', -1) do
      delete comedy_url(@comedy)
    end

    assert_redirected_to comedies_url
  end
end
