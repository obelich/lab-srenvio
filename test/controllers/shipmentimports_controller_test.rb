require 'test_helper'

class ShipmentimportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipmentimport = shipmentimports(:one)
  end

  test "should get index" do
    get shipmentimports_url
    assert_response :success
  end

  test "should get new" do
    get new_shipmentimport_url
    assert_response :success
  end

  test "should create shipmentimport" do
    assert_difference('Shipmentimport.count') do
      post shipmentimports_url, params: { shipmentimport: { shipments: @shipmentimport.shipments, user_id: @shipmentimport.user_id } }
    end

    assert_redirected_to shipmentimport_url(Shipmentimport.last)
  end

  test "should show shipmentimport" do
    get shipmentimport_url(@shipmentimport)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipmentimport_url(@shipmentimport)
    assert_response :success
  end

  test "should update shipmentimport" do
    patch shipmentimport_url(@shipmentimport), params: { shipmentimport: { shipments: @shipmentimport.shipments, user_id: @shipmentimport.user_id } }
    assert_redirected_to shipmentimport_url(@shipmentimport)
  end

  test "should destroy shipmentimport" do
    assert_difference('Shipmentimport.count', -1) do
      delete shipmentimport_url(@shipmentimport)
    end

    assert_redirected_to shipmentimports_url
  end
end
