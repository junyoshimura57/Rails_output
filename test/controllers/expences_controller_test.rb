require 'test_helper'

class ExpencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expences_index_url
    assert_response :success
  end

  test "should get show" do
    get expences_show_url
    assert_response :success
  end

  test "should get new" do
    get expences_new_url
    assert_response :success
  end

  test "should get edit" do
    get expences_edit_url
    assert_response :success
  end

end
