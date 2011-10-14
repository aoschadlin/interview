class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    
    if user
      redirect_to defaultPageForRole(eval(user.roles)), :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged out"
  end
  
  private
  
  def defaultPageForRole(role)
    defaultPage = '/'
    minRole = role.min
    
    case minRole
      when User::ROLE_ADMIN
        defaultPage = '/admin'
      when User::ROLE_COMPANY_ADMIN
        defaultPage = '/coadmin'
      when User::ROLE_RECRUITER
        defaultPage = '/recruiting'
      when User::ROLE_HIRING_MANAGER
        defaultPage = '/hiring'
      when User::ROLE_CANDIDATE
        defaultPage = '/home'
    end
    
    return defaultPage
  end

end
