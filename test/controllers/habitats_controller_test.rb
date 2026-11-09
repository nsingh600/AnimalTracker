require "test_helper"

class HabitatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @habitat = Habitat.create!(region_name: "Test Region", climate: "Tropical")
  end

  test "should get show" do
    get habitat_url(@habitat)
    assert_response :success
  end
end
