require "test_helper"

class SoundsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sounds_new_url
    assert_response :success
  end

  test "should get edit" do
    get sounds_edit_url
    assert_response :success
  end

  test "should get index" do
    get sounds_index_url
    assert_response :success
  end
end
