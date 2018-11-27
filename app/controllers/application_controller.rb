class ApplicationController < ActionController::Base
  include CustomTwitterHelper
  before_action :login_required

  private

    def login_required
      unless user_signed_in?
        redirect_to user_session_path
      end
    end
end
