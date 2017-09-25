class UserInterfaceController < ApplicationController
  def index
    policy_scope(UserInterface)
  end
end
