require "application_system_test_case"

class Publics::RecipesTest < ApplicationSystemTestCase
  setup do
    @publics_recipe = publics_recipes(:one)
  end

  test "visiting the index" do
    visit publics_recipes_url
    assert_selector "h1", text: "Publics/Recipes"
  end

  test "creating a Recipe" do
    visit publics_recipes_url
    click_on "New Publics/Recipe"

    click_on "Create Recipe"

    assert_text "Recipe was successfully created"
    click_on "Back"
  end

  test "updating a Recipe" do
    visit publics_recipes_url
    click_on "Edit", match: :first

    click_on "Update Recipe"

    assert_text "Recipe was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe" do
    visit publics_recipes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe was successfully destroyed"
  end
end
