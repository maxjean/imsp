require 'test_helper'

class CategoryOfPlaylistsChannelsControllerTest < ActionController::TestCase
  setup do
    @category_of_playlists_channel = category_of_playlists_channels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_of_playlists_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_of_playlists_channel" do
    assert_difference('CategoryOfPlaylistsChannel.count') do
      post :create, category_of_playlists_channel: {  }
    end

    assert_redirected_to category_of_playlists_channel_path(assigns(:category_of_playlists_channel))
  end

  test "should show category_of_playlists_channel" do
    get :show, id: @category_of_playlists_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_of_playlists_channel
    assert_response :success
  end

  test "should update category_of_playlists_channel" do
    patch :update, id: @category_of_playlists_channel, category_of_playlists_channel: {  }
    assert_redirected_to category_of_playlists_channel_path(assigns(:category_of_playlists_channel))
  end

  test "should destroy category_of_playlists_channel" do
    assert_difference('CategoryOfPlaylistsChannel.count', -1) do
      delete :destroy, id: @category_of_playlists_channel
    end

    assert_redirected_to category_of_playlists_channels_path
  end
end
