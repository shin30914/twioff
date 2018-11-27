class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]
  def home
  end

  def privacy_policy
  end

  def terms_of_use
  end

  def inquiry
  end
end
