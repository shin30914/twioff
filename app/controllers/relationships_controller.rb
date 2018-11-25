class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new

    client = login_twitter(current_user)

    friends  = client.friend_ids.attrs[:ids]
    @friends = []
    friends.each do |friend|
      @friends << User.find_by(uid: friend)
    end
    @friends.compact! # 何故だかArrayにnilが含まれることがあるので消す
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
  end
end
