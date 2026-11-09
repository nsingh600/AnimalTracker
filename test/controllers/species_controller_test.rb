require "test_helper"

class SpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create!(name: "Mammal")
    @species = Species.create!(
      name: "Lion",
      scientific_name: "Panthera leo",
      diet: "Carnivore",
      conservation_status: "Vulnerable",
      category: @category
    )
  end

  test "should get show" do
    get species_url(@species)
    assert_response :success
  end
end
