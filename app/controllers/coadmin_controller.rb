class CoadminController < ApplicationController
  def index
    # Load all users
    @allUsers = User.where("companyId = :id", {:id => current_user.companyId})
  end  
end
