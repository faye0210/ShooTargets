require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do

  describe 'ユーザー登録のテスト' do
    context 'ユーザーを新規登録した場合' do
      it 'ターゲット一覧（ホーム）が表示されること' do
        visit new_user_registration_path
        fill_in "名前", with: "test_user1"
        fill_in "メールアドレス", with: "test@try.com"
        fill_in "パスワード", with: "password"
        fill_in "確認用パスワード", with: "password"
        click_button "アカウント登録"
        expect(current_path).to eq root_path
      end
    end

    context 'ユーザーがログインせずにターゲット一覧（ホーム）に飛ぼうとした場合' do
      it 'ログイン画面が表示されること' do
        visit targets_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
    end
    context 'ログインをする場合' do
      it 'タスク一覧が表示されること' do
        visit new_user_session_path
        fill_in "名前またはメールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_on "ログイン"
        expect(current_path).to eq root_path
      end
    end

    context 'ログインしている場合' do
      before do
        visit new_user_session_path
        fill_in "名前またはメールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_on "ログイン"
      end

      it 'マイページに飛ぶとユーザーの詳細が表示されること' do
        visit user_path(id: @user.id)
        expect(current_path).to eq user_path(id: @user.id)
      end

      it 'ログアウトするとログイン画面が表示されること' do
        visit user_path(id: @user.id)
        find(".sidebarIconToggle").click
        click_link "LOGOUT"
        expect(page).to have_content "ログイン"
      end
    end
  end
end
