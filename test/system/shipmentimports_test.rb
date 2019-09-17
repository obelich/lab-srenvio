require "application_system_test_case"

class ShipmentimportsTest < ApplicationSystemTestCase
  setup do
    @shipmentimport = shipmentimports(:one)
  end

  test "visiting the index" do
    visit shipmentimports_url
    assert_selector "h1", text: "Shipmentimports"
  end

  test "creating a Shipmentimport" do
    visit shipmentimports_url
    click_on "New Shipmentimport"

    fill_in "Shipments", with: @shipmentimport.shipments
    fill_in "User", with: @shipmentimport.user_id
    click_on "Create Shipmentimport"

    assert_text "Shipmentimport was successfully created"
    click_on "Back"
  end

  test "updating a Shipmentimport" do
    visit shipmentimports_url
    click_on "Edit", match: :first

    fill_in "Shipments", with: @shipmentimport.shipments
    fill_in "User", with: @shipmentimport.user_id
    click_on "Update Shipmentimport"

    assert_text "Shipmentimport was successfully updated"
    click_on "Back"
  end

  test "destroying a Shipmentimport" do
    visit shipmentimports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shipmentimport was successfully destroyed"
  end
end
