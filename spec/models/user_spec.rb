require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録に関するテスト' do
    it '重複しないメールアドレスと6文字以上パスワードがあれば有効な状態であること' do
      expect(@user).to be_valid
    end
  
    it 'メールアドレスがなければ無効な状態であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
  
    it 'パスワードがなければ無効な状態であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
  
    it 'メールアドレスが重複していたら無効な状態であること' do
      user1 = User.create(email: 'test@example.com', password: '123456')
      user2 = User.create(email: 'test@example.com', password: '123456')
      expect(user2.errors.full_messages).to include("メールアドレスはすでに存在します")
    end
  
    it 'パスワードが6文字以下であれば無効な状態であること' do
      @user.password = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
  end
end

