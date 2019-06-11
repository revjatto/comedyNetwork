require "application_system_test_case"

class ComediesTest < ApplicationSystemTestCase
  setup do
    @comedy = comedies(:one)
  end

  test "visiting the index" do
    visit comedies_url
    assert_selector "h1", text: "Comedies"
  end

  test "creating a Comedy" do
    visit comedies_url
    click_on "New Comedy"

    fill_in "Body", with: @comedy.body
    fill_in "Title", with: @comedy.title
    fill_in "User", with: @comedy.user_id
    click_on "Create Comedy"

    assert_text "Comedy was successfully created"
    click_on "Back"
  end

  test "updating a Comedy" do
    visit comedies_url
    click_on "Edit", match: :first

    fill_in "Body", with: @comedy.body
    fill_in "Title", with: @comedy.title
    fill_in "User", with: @comedy.user_id
    click_on "Update Comedy"

    assert_text "Comedy was successfully updated"
    click_on "Back"
  end

  test "destroying a Comedy" do
    visit comedies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comedy was successfully destroyed"
  end
end
