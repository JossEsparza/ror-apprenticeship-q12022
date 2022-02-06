require "test_helper"

class SpriteSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sprite_set = sprite_sets(:one)
  end

  test "should get index" do
    get sprite_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_sprite_set_url
    assert_response :success
  end

  test "should create sprite_set" do
    assert_difference("SpriteSet.count") do
      post sprite_sets_url, params: { sprite_set: { back_default: @sprite_set.back_default, back_female: @sprite_set.back_female, back_shiny: @sprite_set.back_shiny, back_shiny_female: @sprite_set.back_shiny_female, front_default: @sprite_set.front_default, front_female: @sprite_set.front_female, front_shiny: @sprite_set.front_shiny, front_shiny_female: @sprite_set.front_shiny_female, sprites_on_id: @sprite_set.sprites_on_id, sprites_on_type: @sprite_set.sprites_on_type } }
    end

    assert_redirected_to sprite_set_url(SpriteSet.last)
  end

  test "should show sprite_set" do
    get sprite_set_url(@sprite_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_sprite_set_url(@sprite_set)
    assert_response :success
  end

  test "should update sprite_set" do
    patch sprite_set_url(@sprite_set), params: { sprite_set: { back_default: @sprite_set.back_default, back_female: @sprite_set.back_female, back_shiny: @sprite_set.back_shiny, back_shiny_female: @sprite_set.back_shiny_female, front_default: @sprite_set.front_default, front_female: @sprite_set.front_female, front_shiny: @sprite_set.front_shiny, front_shiny_female: @sprite_set.front_shiny_female, sprites_on_id: @sprite_set.sprites_on_id, sprites_on_type: @sprite_set.sprites_on_type } }
    assert_redirected_to sprite_set_url(@sprite_set)
  end

  test "should destroy sprite_set" do
    assert_difference("SpriteSet.count", -1) do
      delete sprite_set_url(@sprite_set)
    end

    assert_redirected_to sprite_sets_url
  end
end
