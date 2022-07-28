require "application_system_test_case"

class GradingsTest < ApplicationSystemTestCase
  setup do
    @grading = gradings(:one)
  end

  test "visiting the index" do
    visit gradings_url
    assert_selector "h1", text: "Gradings"
  end

  test "creating a Grading" do
    visit gradings_url
    click_on "New Grading"

    check "Isgrading" if @grading.isGrading
    click_on "Create Grading"

    assert_text "Grading was successfully created"
    click_on "Back"
  end

  test "updating a Grading" do
    visit gradings_url
    click_on "Edit", match: :first

    check "Isgrading" if @grading.isGrading
    click_on "Update Grading"

    assert_text "Grading was successfully updated"
    click_on "Back"
  end

  test "destroying a Grading" do
    visit gradings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grading was successfully destroyed"
  end
end
