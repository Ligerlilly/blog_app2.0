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
    #@users.banned?

    @possible_banned_users = User.find(params[:users].keys)
    @possible_banned_users.each do |user|
      if user.banned?
        user.comments.each do |comment|
          comment.destroy
        end
      end
    end

    if @users.empty?
      redirect_to admin_users_path
    else
      render "edit_multiple"
    end
  end
  
 
  private
  def find_user
    @user = User.find(params[:id])
  end
end
