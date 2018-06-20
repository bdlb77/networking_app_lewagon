require 'test_helper'

class AssigmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get assigments_new_url
    assert_response :success
  end

  test "should get create" do
    get assigments_create_url
    assert_response :success
  end

  test "should get edit" do
    get assigments_edit_url
    assert_response :success
  end

  test "should get index" do
    get assigments_index_url
    assert_response :success
  end

  test "should get update" do
    get assigments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get assigments_destroy_url
    assert_response :success
  end

end
