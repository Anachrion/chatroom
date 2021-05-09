require "application_system_test_case"

class ChatroomInstancesTest < ApplicationSystemTestCase
  setup do
    @chatroom_instance = chatroom_instances(:one)
  end

  test "visiting the index" do
    visit chatroom_instances_url
    assert_selector "h1", text: "Chatroom Instances"
  end

  test "creating a Chatroom instance" do
    visit chatroom_instances_url
    click_on "New Chatroom Instance"

    fill_in "Name", with: @chatroom_instance.name
    click_on "Create Chatroom instance"

    assert_text "Chatroom instance was successfully created"
    click_on "Back"
  end

  test "updating a Chatroom instance" do
    visit chatroom_instances_url
    click_on "Edit", match: :first

    fill_in "Name", with: @chatroom_instance.name
    click_on "Update Chatroom instance"

    assert_text "Chatroom instance was successfully updated"
    click_on "Back"
  end

  test "destroying a Chatroom instance" do
    visit chatroom_instances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chatroom instance was successfully destroyed"
  end
end
