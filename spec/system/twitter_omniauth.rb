require 'rails_helper'

feature "OmniAuth interface" do

  before { OmniAuth.config.mock_auth[:twitter] = nil }

  describe "Twitterに登録されていない新しいユーザーまたはログインしていないユーザー" do
    let(:submit) { "Twitterで登録" }
    let(:logout) { "ログアウト" }

    context "ログイン失敗の場合" do
      before do
        visit root_path
        set_invalid_omniauth
        click_link(submit)
      end
      it "登録ページに飛ばされる" do
        expect(page).to have_content('Twitterで登録')
      end
    end

    context "ログイン成功の場合" do
      before do
        visit root_path
        set_omniauth
        click_link(submit)
      end
      it "ログイン成功の文字が表示される" do
        expect(page).to have_content('Twitter から承認されました。')
      end
      context "ログアウトボタンを押す" do
        before { click_link(logout) }
        it "登録ページに飛ばされる" do
          expect(page).to have_content('Twitterで登録')
        end
        it "ログアウト成功の文字が表示される" do
          expect(page).to have_content('ログアウトしました。')
        end
      end
    end
  end
end