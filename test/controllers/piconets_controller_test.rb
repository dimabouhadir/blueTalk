require 'test_helper'

class PiconetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piconet = piconets(:one)
  end

  test "should get index" do
    get piconets_url
    assert_response :success
  end

  test "should get new" do
    get new_piconet_url
    assert_response :success
  end

  test "should create piconet" do
    assert_difference('Piconet.count') do
      post piconets_url, params: { piconet: { channel_id: @piconet.channel_id, master_id: @piconet.master_id, name: @piconet.name, timer: @piconet.timer } }
    end

    assert_redirected_to piconet_url(Piconet.last)
  end

  test "should show piconet" do
    get piconet_url(@piconet)
    assert_response :success
  end

  test "should get edit" do
    get edit_piconet_url(@piconet)
    assert_response :success
  end

  test "should update piconet" do
    patch piconet_url(@piconet), params: { piconet: { channel_id: @piconet.channel_id, master_id: @piconet.master_id, name: @piconet.name, timer: @piconet.timer } }
    assert_redirected_to piconet_url(@piconet)
  end

  test "should destroy piconet" do
    assert_difference('Piconet.count', -1) do
      delete piconet_url(@piconet)
    end

    assert_redirected_to piconets_url
  end
end
