require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  test "accepts a regular number" do
    send_number("0631125631")
    assert_equal root_path, page.current_path
    assert_text "Nous vous rappellerons dans les plus brefs délais."
  end

  test "gets number in db" do
    send_number("0631125631")
    assert_equal Phone.where(number: "0631125631").first.number, "0631125631"
  end

  test "rejects a wrong number" do
    send_number("063115631")
    assert_equal root_path, page.current_path
    assert_text "Ce numéro n'est pas valable. Merci d'essayer à nouveau."
  end

  test "home page has a navbar" do
    visit "/"
    assert_selector ".navbar-wagon"
    # change navbar selector if navbar changes and don't uses same name
  end

  test "user can sign in" do
    login(:user)
    assert_equal root_path, page.current_path
  end

  test "connected user can access his interface" do
    login(:user)
    assert_equal root_path, page.current_path
    click_on "my interface"
    assert_equal user_interface_index_path, page.current_path
  end

  test "regular user can't access admin interface" do
    login(:user)
    assert_equal root_path, page.current_path
    assert_no_text 'admin interface'
  end

  test "admin can login" do
    login(:admin)
    assert_equal root_path, page.current_path
  end

  test "admin can visit is interface" do
    login(:admin)
    assert_equal root_path, page.current_path
    assert_text "admin interface"
    # click_on "admin interface" # uncomment this line when the admin inteface path will be created and added to navbar
  end

  private

  def login (role)
    Warden.test_reset!
    visit "/"
    user = FactoryGirl.create(role)
    click_on "Login"
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on "Sign in"
  end

  def send_number(number)
    visit "/"
    fill_in "_number", with: number
    click_on "Envoyer"
  end
end
