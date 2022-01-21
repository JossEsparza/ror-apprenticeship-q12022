require "application_system_test_case"

class SpriteSetsTest < ApplicationSystemTestCase
  setup do
    @sprite_set = sprite_sets(:one)
  end

  test "visiting the index" do
    visit sprite_sets_url
    assert_selector "h1", text: "Sprite sets"
  end

  test "should create sprite set" do
    visit sprite_sets_url
    click_on "New sprite set"

    fill_in "Back default", with: @sprite_set.back_default
    fill_in "Back female", with: @sprite_set.back_female
    fill_in "Back shiny", with: @sprite_set.back_shiny
    fill_in "Back shiny female", with: @sprite_set.back_shiny_female
    fill_in "Front default", with: @sprite_set.front_default
    fill_in "Front female", with: @sprite_set.front_female
    fill_in "Front shiny", with: @sprite_set.front_shiny
    fill_in "Front shiny female", with: @sprite_set.front_shiny_female
    fill_in "Sprites on", with: @sprite_set.sprites_on_id
    fill_in "Sprites on type", with: @sprite_set.sprites_on_type
    click_on "Create Sprite set"

    assert_text "Sprite set was successfully created"
    click_on "Back"
  end

  test "should update Sprite set" do
    visit sprite_set_url(@sprite_set)
    click_on "Edit this sprite set", match: :first

    fill_in "Back default", with: @sprite_set.back_default
    fill_in "Back female", with: @sprite_set.back_female
    fill_in "Back shiny", with: @sprite_set.back_shiny
    fill_in "Back shiny female", with: @sprite_set.back_shiny_female
    fill_in "Front default", with: @sprite_set.front_default
    fill_in "Front female", with: @sprite_set.front_female
    fill_in "Front shiny", with: @sprite_set.front_shiny
    fill_in "Front shiny female", with: @sprite_set.front_shiny_female
    fill_in "Sprites on", with: @sprite_set.sprites_on_id
    fill_in "Sprites on type", with: @sprite_set.sprites_on_type
    click_on "Update Sprite set"

    assert_text "Sprite set was successfully updated"
    click_on "Back"
  end

  test "should destroy Sprite set" do
    visit sprite_set_url(@sprite_set)
    click_on "Destroy this sprite set", match: :first

    assert_text "Sprite set was successfully destroyed"
  end
end
