require 'test_helper'

class Admin::ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_children_new_url
    assert_response :success
  end

end
