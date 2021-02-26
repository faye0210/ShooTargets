require 'rails_helper'
RSpec.describe 'ターゲット管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
    visit new_user_session_path
    fill_in "名前またはメールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_on "ログイン"
  end

  describe '新規作成機能' do
    context 'ターゲットを新規作成した場合' do
      it '作成したターゲットが表示される' do
        @target = FactoryBot.create(:target, user: @user)
        visit root_path
        expect(page).to have_content 'target1'
      end
    end
  end

  describe "編集機能" do
    context "ターゲットの編集に遷移" do
      it "ターゲットの詳細が表示される" do
        @target = FactoryBot.create(:target, user: @user)
        visit root_path
        click_link "Edit"
        expect(page).to have_content 'Edit Target'
      end
    end
  end

  describe "削除機能" do
    context "ターゲットの削除を選んだ場合" do
      it "ターゲットが削除される" do
        @target = FactoryBot.create(:target, user: @user)
        visit root_path
        page.accept_confirm do
          click_link "Destroy"
        end
        expect(page).to have_content 'ターゲットを削除しました！'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      @target = FactoryBot.create(:target, user: @user)
      @third_target = FactoryBot.create(:third_target, user: @user)
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのターゲット一覧が表示される' do
        visit targets_path
        expect(page).to have_content 'target1'
        expect(page).to have_content 'target3'
      end
    end

    context 'ターゲットが作成順に並んでいる場合' do
      it '終了期日が近いターゲットが一番上に表示される' do
        visit root_path
        click_link 'Sort as Deadline'
        visit targets_path(sort_link: :true)
        target_list = all('.target_block')
        expect(target_list[0]).to have_content "target1"
        expect(target_list[1]).to have_content "target3"
      end

      it '終了期日が遠いターゲットが一番上に表示される' do
        visit root_path
        click_link 'Sort as Deadline'
        visit targets_path(sort_link: :true)
        target_list = all('.target_block')
        expect(target_list[0]).to have_content "target3"
        expect(target_list[1]).to have_content "target1"
      end
    end
  end

  describe 'ターゲット管理機能', type: :system do
    before do
      @target = FactoryBot.create(:target, user: @user)
      @third_target = FactoryBot.create(:third_target, user: @user)
    end
    describe '検索機能' do
      context 'タイトルであいまい検索をした場合' do
        it "検索キーワードを含むターゲットで絞り込まれる" do
          visit root_path
          fill_in :q_title_cont, with: "1"
          click_button 'Search'
          expect(page).to have_content "target1"
        end
      end
      context 'ステータス検索をした場合' do
        it "ステータスに完全一致するターゲットが絞り込まれる" do
          visit root_path
          choose 'q_status_eq_false'
          click_button 'Search'
          expect(page).to have_content "target1"
        end
      end
      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するターゲット絞り込まれる" do
          visit root_path
          fill_in :q_title_cont, with: "3"
          choose 'q_status_eq_true'
          click_button 'Search'
          expect(page).to have_content 'target3'
        end
      end
    end
  end

  describe '詳細表示機能' do
     context '任意のターゲット詳細画面に遷移した場合' do
       it '該当ターゲットの内容が表示される' do
         @third_target = FactoryBot.create(:third_target, user: @user)
         visit target_path(@third_target.id)
         expect(page).to have_content 'target3'
       end
     end
  end
end
