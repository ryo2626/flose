require 'test_helper'

class Publics::RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publics_recipe = publics_recipes(:one)
  end

  test "should get index" do
    get publics_recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_publics_recipe_url
    assert_response :success
  end

  test "should create publics_recipe" do
    assert_difference('Publics::Recipe.count') do
      post publics_recipes_url, params: { publics_recipe: {  } }
    end

    assert_redirected_to publics_recipe_url(Publics::Recipe.last)
  end

  test "should show publics_recipe" do
    get publics_recipe_url(@publics_recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_publics_recipe_url(@publics_recipe)
    assert_response :success
  end

  test "should update publics_recipe" do
    patch publics_recipe_url(@publics_recipe), params: { publics_recipe: {  } }
    assert_redirected_to publics_recipe_url(@publics_recipe)
  end

  test "should destroy publics_recipe" do
    assert_difference('Publics::Recipe.count', -1) do
      delete publics_recipe_url(@publics_recipe)
    end

    assert_redirected_to publics_recipes_url
  end
end
