require 'test_helper'

class SkillOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get skill_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get skill_orders_create_url
    assert_response :success
  end

  test "should get index" do
    get skill_orders_index_url
    assert_response :success
  end

end
