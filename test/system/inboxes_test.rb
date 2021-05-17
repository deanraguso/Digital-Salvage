require "application_system_test_case"

class InboxesTest < ApplicationSystemTestCase
  setup do
    @inbox = inboxes(:one)
  end

  test "visiting the index" do
    visit inboxes_url
    assert_selector "h1", text: "Inboxes"
  end

  test "creating a Inbox" do
    visit inboxes_url
    click_on "New Inbox"

    click_on "Create Inbox"

    assert_text "Inbox was successfully created"
    click_on "Back"
  end

  test "updating a Inbox" do
    visit inboxes_url
    click_on "Edit", match: :first

    click_on "Update Inbox"

    assert_text "Inbox was successfully updated"
    click_on "Back"
  end

  test "destroying a Inbox" do
    visit inboxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inbox was successfully destroyed"
  end
end
