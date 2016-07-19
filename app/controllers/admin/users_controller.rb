class Admin::UsersController < ApplicationController

  before_action :admin_check

  def admin_check
    if current_user.nil? || !current_user.admin?
      flash[:alert] = "You are not an admin."
      redirect_to root_path
    end
  end

  def index
  end

  def show
  end

  def new
  end

  def edit
  end
end
