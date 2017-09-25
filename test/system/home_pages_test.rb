require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  test "accepts a regular number" do
    visit "/"
    fill_in "_number", with: "0631125631"
    click_on "Envoyer"
    assert_equal root_path, page.current_path
    assert_text "Nous vous rappellerons dans les plus brefs délais."
  end

  test "rejects a wrong number" do
    visit "/"
    fill_in "_number", with: "063112563"
    click_on "Envoyer"
    assert_equal root_path, page.current_path
    assert_text "Ce numéro n'est pas valable. Merci d'essayer à nouveau."
  end

  test "home page has a navbar" do
    visit "/"
    assert_selector ".navbar-wagon"
    # change navbar selector if navbar changes and don't uses same name
  end

  test "user can sign in" do
    visit "/"
    click_on "Login"
    user = FactoryGirl.create(:user)
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on "Sign in"
    assert_equal root_path, page.current_path
  end

  test "connected user can access his interface" do
    Warden.test_reset!
    visit "/"
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on "Sign in"
    assert_equal root_path, page.current_path
    click_on "my interface"
    assert_equal user_interface_index_path, page.current_path
  end

  test "regular user can't access admin interface" do
    Warden.test_reset!
    visit "/"
    user = FactoryGirl.create(:user)
    click_on "Login"
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on "Sign in"
    assert_equal root_path, page.current_path
    assert_no_text 'admin interface'
  end

  test "admin can login" do
    Warden.test_reset!
    visit "/"
    admin = FactoryGirl.create(:admin)
    click_on "Login"
    fill_in 'user[email]', with: admin.email
    fill_in 'user[password]', with: admin.password
    click_on "Sign in"
    assert_equal root_path, page.current_path
  end

  test "admin can visit is interface" do
    Warden.test_reset!
    visit "/"
    admin = FactoryGirl.create(:admin)
    click_on "Login"
    fill_in 'user[email]', with: admin.email
    fill_in 'user[password]', with: admin.password
    click_on "Sign in"
    assert_equal root_path, page.current_path
    assert_text "admin interface"
    # click_on "admin interface" # uncomment this line when the admin inteface path will be created and added to navbar
  end
end
