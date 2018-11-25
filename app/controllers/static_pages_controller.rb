class StaticPagesController < ApplicationController
  def home
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def privacy_policy
  end

  def terms_of_use
  end

  def inquiry
  end
end
