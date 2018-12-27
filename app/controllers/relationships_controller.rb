class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def new
    @relationship = Relationship.new

    client = login_twitter(current_user)
# Todo
# TwitterTooManyRequestの例外処理なのだが他の例外が起きた場合このままだと分からないのでエラーをログに残したい
    begin
      friends  = client.friend_ids.attrs[:ids]
      followers = client.follower_ids.attrs[:ids]
      ffs = friends + followers
      ffs.uniq!
      @ffs = []
      ffs.each do |ff|
        @ffs << User.find_by(uid: ff)
        end
      @ffs.compact! # Arrayに含まれるnilを削除
    rescue
      flash[:notice] = "新規登録画面のご利用は15分ほどお待ちください。"
      redirect_to root_path
    end
  end

  def create
    @user = User.find(params[:relationship][:followed_id])
    @relationship = current_user.follow(@user)
    respond_to do |format|
      if @user.following?(current_user)
        format.json { render json: { relationships: @relationship, isMatch: true }}
      end
      format.json { render json: { relationships:  @relationship, isMatch: false }}
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.json { render json: nil }
    end
  end

  def index
    @match_users = current_user.match_users
    @number_of_followers = current_user.number_of_followers
  end
end
