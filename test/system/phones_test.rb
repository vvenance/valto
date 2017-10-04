require "application_system_test_case"

class PhonesTest < ApplicationSystemTestCase
  test "admin can set phone number as called" do
    phone = FactoryGirl.create(:phone)
    AnAdmin = FactoryGirl.create(:user)
    login_as AnAdmin, :scope => :user
    visit admin_show_path
    save_and_open_screenshot
    click_on "Noter appelé"
    assert_equal phone.called, true
  end
end
