require "test_helper"

class Admin::ProductionAreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_production_areas_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_production_areas_edit_url
    assert_response :success
  end
end
