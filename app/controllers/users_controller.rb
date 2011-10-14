class UsersController < ApplicationController
  def new_candidate
    @user = User.new
  end
  
  def new_company_admin
    @company = Company.new
    @user = User.new
  end
  
  def new
    @user = User.new
  end
  
  def create_candidate
    @user = User.new(params[:user])
    @user.roles = [User::ROLE_CANDIDATE].to_s
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  def create_company_admin
    @company = Company.new(params[:company])
    if @company.save
      @user = User.new(params[:user])
      # Manually associate the optional company
      @user.companyId = @company.id
      @user.roles = [User::ROLE_COMPANY_ADMIN].to_s
      if @user.save
        redirect_to root_url, :notice => "Signed up!"
      else
        render :new_company_admin
      end
    else
      render :new_company_admin
    end
  end

  def create
    @user = User.new(params[:user])
    roles = []
    for role in params[:role]
      roles.push(role.to_i)
    end
    @user.roles = roles.to_s
    @user.companyId = current_user.companyId
    if @user.save
      redirect_to coadmin_path, :notice => "Account created"
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @userRoles = eval(@user.roles)
  end
  
  def update
    # Create our Roles string
    roles = []
    for role in params[:role]
      roles.push(role.to_i)
    end
    roles = roles.to_s
    attr = {
      :firstName => params[:user][:firstName],
      :lastName => params[:user][:lastName],
      :email => params[:user][:email],
      :password => params[:user][:password],
      :password_confirmation => params[:user][:password_confirmation],
      :roles => roles
    }
    if User.find(params[:id]).update_attributes(attr)    
      redirect_to coadmin_path, :notice => "Update complete"
    else
      redirect_to coadmin_path, :notice => "Update failed"
    end
  end
end
