class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :loginRedirect, :except => [:new, :create, :destroy,
    :new_candidate, :new_company_admin,
    :create_candidate, :create_company_admin,
    :root, :pricing, :contact]

  def loginRedirect
    if not current_user
      redirect_to '/login'
    end
  end
end
