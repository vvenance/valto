class AdminController < ApplicationController
  def index
    @phones = policy_scope(Phone)
    @admin = policy_scope(Admin)
  end
end
