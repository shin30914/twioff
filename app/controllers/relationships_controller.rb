class RelationshipsController < ApplicationController
  def new
    require 'twitter'
    require 'pp'
    # ログイン
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET_KEY']
      config.access_token        = current_user.token
      config.access_token_secret = current_user.secret
    end

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

  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
  end
end
