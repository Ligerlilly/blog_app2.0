class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: :show
  def show
    
  end
  
  def index
    @users = User.all
  end
  
  def edit_multiple
    @users = User.find(params[:user_ids])
  end

  def update_multiple
    @users = User.update(params[:users].keys, params[:users].values)
    @users.reject! { |p| p.errors.empty? }
    if @users.empty?
      redirect_to admin_users_path
    else
      render "edit_multiple"
    end
  end

  def update_admin_multiple
    unless params[:user_ids]
      redirect_to admin_users_path
      return
    end
    
    User.find(params[:user_ids]).each do |user|
      if user.admin
        user.update({admin: false})
      else
        user.update({admin: true})
      end
    end
    redirect_to admin_users_path
  end
  
 
  private
  def find_user
    @user = User.find(params[:id])
  end
end
