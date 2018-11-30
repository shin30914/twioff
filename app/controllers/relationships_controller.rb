class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def new
    @relationship = Relationship.new

    client = login_twitter(current_user)

    friends  = client.friend_ids.attrs[:ids]
    @friends = []
    friends.each do |friend|
      @friends << User.find_by(uid: friend)
    end
    @friends.compact! # Arrayに含まれるnilを削除
  end

  def create
    user = User.find(params[:relationship][:followed_id])
    current_user.follow(user)
    redirect_to root_path
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
  end

  def index
    @match_users = current_user.match_users
    @number_of_followers = current_user.number_of_followers
  end
end
