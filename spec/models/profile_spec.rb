require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @profile = @user.build_profile(name: 'yamada')
  end

  describe 'プロフィール登録に関するテスト' do
    it '名前とユーザーidがあれば有効であること' do
      expect(@profile).to be_valid
    end
  
    it '名前がなければ無効であること' do
      @profile.name = nil
      expect(@profile).to_not be_valid
    end
  
    it 'コメントが250文字以内であれば有効であること'do
      @profile.content = 'a'*250
      expect(@profile).to be_valid
    end
  
    it 'コメントが251文字以上であれば無効であること' do
      @profile.content = 'a'*251
      expect(@profile).to_not be_valid
    end
  end
end
