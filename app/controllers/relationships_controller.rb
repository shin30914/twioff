class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def new
    @relationship = Relationship.new

    client = login_twitter(current_user)
# Todo
# TwitterTooManyRequestの例外処理なのだが他の例外が起きた場合このままだと分からないのでエラーをログに残したい
    begin
      friends  = client.friend_ids.attrs[:ids]
      @friends = []
      friends.each do |friend|
        @friends << User.find_by(uid: friend)
      end
      @friends.compact! # Arrayに含まれるnilを削除
    rescue
      flash[:notice] = "新規登録画面のご利用は15分ほどお待ちください。"
      redirect_to root_path
    end

  end

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow(@user)
    if @user.following?(current_user)
      flash[:alert] = "おめでとうございます！マッチしました！連絡を取ってみてね！"
    end
    respond_to do |format|
      format.html { redirect_to new_relationship_path }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to new_relationship_path }
      format.js
    end
  end

  def index
    @match_users = current_user.match_users
    @number_of_followers = current_user.number_of_followers
  end
end
