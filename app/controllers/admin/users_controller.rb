class Admin::UsersController < ApplicationController

  before_action :require_admin


  def index
    @users = User.page(params[:page]).per(10  )

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "#{@user.full_name} has been created"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path(@user)
    else
      render :edit
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   UserMailer.user_deletion_email(@user).deliver_now
  #   @user.destroy
  #   redirect_to admin_users_path, notice: "#{@user.full_name} was deleted successfully!"
  # end

  protected

  def require_admin
    if current_user.nil? || !current_user.admin?
      flash[:alert] = "You are not an admin."
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

  
end
