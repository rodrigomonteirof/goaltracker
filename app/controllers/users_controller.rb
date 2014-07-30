class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_no_authentication, :only => [:new, :create]
  before_action :can_change, :only => [:edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailerWorker.perform_async(@user.id)
      redirect_to "/", notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to "/", notice: 'User was successfully created.'
    else
      render action: 'edit'
    end
  end

  def login
  end

  def do_login
    @session = UserSession.new(session, {email: params[:user][:email], password: params[:user][:password]})
    @user = @session.authenticate
    if @user.present?
      redirect_to goals_path
    else
      render :login
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def can_change
      unless user_signed? && current_user == user
        redirect_to root_path
      end
    end

    def user
      @user ||= User.find(params[:id])
    end

end
