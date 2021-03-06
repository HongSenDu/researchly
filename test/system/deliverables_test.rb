require "application_system_test_case"

class DeliverablesTest < ApplicationSystemTestCase
  setup do
    @deliverable = deliverables(:one)
  end

  test "visiting the index" do
    visit deliverables_url
    assert_selector "h1", text: "Deliverables"
  end

  test "creating a Deliverable" do
    visit deliverables_url
    click_on "New Deliverable"

    click_on "Create Deliverable"

    assert_text "Deliverable was successfully created"
    click_on "Back"
  end

  test "updating a Deliverable" do
    visit deliverables_url
    click_on "Edit", match: :first

    click_on "Update Deliverable"

    assert_text "Deliverable was successfully updated"
    click_on "Back"
  end

  test "destroying a Deliverable" do
    visit deliverables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deliverable was successfully destroyed"
  end
end
