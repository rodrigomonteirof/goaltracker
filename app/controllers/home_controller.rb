class HomeController < ApplicationController

  before_action :check_login, only: [:index]

  def index

  end

  private
    def check_login
      redirect_to Goal if user_signed_in?
    end

end
