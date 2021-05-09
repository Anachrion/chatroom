require "test_helper"

class ChatroomInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatroom_instance = chatroom_instances(:one)
  end

  test "should get index" do
    get chatroom_instances_url
    assert_response :success
  end

  test "should get new" do
    get new_chatroom_instance_url
    assert_response :success
  end

  test "should create chatroom_instance" do
    assert_difference('ChatroomInstance.count') do
      post chatroom_instances_url, params: { chatroom_instance: { name: @chatroom_instance.name } }
    end

    assert_redirected_to chatroom_instance_url(ChatroomInstance.last)
  end

  test "should show chatroom_instance" do
    get chatroom_instance_url(@chatroom_instance)
    assert_response :success
  end

  test "should get edit" do
    get edit_chatroom_instance_url(@chatroom_instance)
    assert_response :success
  end

  test "should update chatroom_instance" do
    patch chatroom_instance_url(@chatroom_instance), params: { chatroom_instance: { name: @chatroom_instance.name } }
    assert_redirected_to chatroom_instance_url(@chatroom_instance)
  end

  test "should destroy chatroom_instance" do
    assert_difference('ChatroomInstance.count', -1) do
      delete chatroom_instance_url(@chatroom_instance)
    end

    assert_redirected_to chatroom_instances_url
  end
end
