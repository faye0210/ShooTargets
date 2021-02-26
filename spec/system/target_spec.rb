require 'rails_helper'
RSpec.describe 'ターゲット管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in "session_email", with: @user.email
    fill_in "session_password", with: @user.password
    click_on "ログイン"
  end
  describe '新規作成機能' do
    context 'ターゲットを新規作成した場合' do
      it '作成したターゲットが表示される' do
        FactoryBot.create(:target, user: @user)
        visit targets_path
        expect(page).to have_content 'target1'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      FactoryBot.create(:target, user: @user)
      FactoryBot.create(:second_target, user: @user)
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのターゲット一覧が表示される' do
        visit targets_path
        expect(page).to have_content 'target1'
        expect(page).to have_content 'target2'
      end
    end

    # context 'ターゲットが作成順に並んでいる場合' do
    #   it '終了期日が遅いターゲットが一番上に表示される' do
    #     visit targets_path
    #     click_link 'Sort as Deadline'
    #     visit targets_path(deadline_sort: :true)
    #     target_list = all('.target_block')
    #     expect(target_list[0]).to have_content "Factoryで作ったデフォルトのタイトル２"
    #     expect(target_list[1]).to have_content "Factoryで作ったデフォルトのタイトル１"
    #   end
    # end
    #
    # context 'ターゲットが優先順位の昇順に並んでいる場合' do
    #   it '優先順位が高いターゲットが一番上に表示される' do
    #     visit targets_path
    #     click_link '優先順位に並べ替える'
    #     visit targets_path(priority_sort: :true)
    #     target_list = all('.target_block')
    #     expect(target_list[0]).to have_content "Factoryで作ったデフォルトのタイトル１"
    #     expect(target_list[1]).to have_content "Factoryで作ったデフォルトのタイトル２"
    #   end
    # end
  end

  describe 'ターゲット管理機能', type: :system do
    before do
      FactoryBot.create(:target, user: @user)
      FactoryBot.create(:second_target, user: @user)
    end
  #   describe '検索機能' do
  #     context 'タイトルであいまい検索をした場合' do
  #       it "検索キーワードを含むターゲットで絞り込まれる" do
  #         visit targets_path
  #         fill_in 'target_s', with: "Factoryで作ったデフォルトのタイトル１"
  #         click_button '検索'
  #         expect(page).to have_content "Factoryで作ったデフォルトのタイトル１"
  #       end
  #     end
  #     context 'ステータス検索をした場合' do
  #       it "ステータスに完全一致するターゲットが絞り込まれる" do
  #         visit targets_path
  #         select '未着手', from: 'target_status'
  #         click_button '検索'
  #         expect(page).to have_content "未着手"
  #       end
  #     end
  #     context 'タイトルのあいまい検索とステータス検索をした場合' do
  #       it "検索キーワードをタイトルに含み、かつステータスに完全一致するターゲット絞り込まれる" do
  #         visit targets_path
  #         fill_in 'target_s', with: "Factoryで作ったデフォルトのタイトル１"
  #         select '未着手', from: 'target_status'
  #         click_button '検索'
  #         expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
  #         expect(page).to have_content '未着手'
  #       end
  #     end
  #   end
  end

  describe '詳細表示機能' do
     context '任意のターゲット詳細画面に遷移した場合' do
       it '該当ターゲットの内容が表示される' do
         target = FactoryBot.create(:target)
         visit target_path(id: target.id)
         expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
       end
     end
  end
end
