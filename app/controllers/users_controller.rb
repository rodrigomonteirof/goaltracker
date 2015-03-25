class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_no_authentication, only: [:new, :create]
  before_action :can_change, only: [:edit, :update]

  def oauth_login
    user = User.find_or_create(auth)
    user.assign_session(session)

    redirect_to root_path
  end

  def logout
    current_user.destroy_session(session)

    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
