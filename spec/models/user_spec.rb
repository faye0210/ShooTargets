require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "バリデーション" do
    it "名前とメールアドレスとパスワードのどれも設定されている" do
      expect(@user.valid?).to eq(true)
    end

    it "名前が空だとNG" do
      @user.name = " "
      expect(@user.valid?).to eq(false)
    end

    it "メールアドレスが空だとNG" do
      @user.email = " "
      expect(@user.valid?).to eq(false)
    end

    it "パスワードが空だとNG" do
      @user.password = " "
      expect(@user.valid?).to eq(false)
    end
  end
end
