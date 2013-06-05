require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  setup do
    @reply = replies(:one)
  end

  test "should get new" do
    get :new, :topic_id => @reply.topic_id
    assert_response :success
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post :create, :topic_id => @reply.topic_id, reply: { content: @reply.content }
    end

    assert_redirected_to topic_path(assigns(:reply).topic)
  end

end
