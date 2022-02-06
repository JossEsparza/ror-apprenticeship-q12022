require "test_helper"

class AbilityPokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ability_pokemons_new_url
    assert_response :success
  end

  test "should get index" do
    get ability_pokemons_index_url
    assert_response :success
  end

  test "should get show" do
    get ability_pokemons_show_url
    assert_response :success
  end

  test "should get edit" do
    get ability_pokemons_edit_url
    assert_response :success
  end

  test "should get delete" do
    get ability_pokemons_delete_url
    assert_response :success
  end
end
