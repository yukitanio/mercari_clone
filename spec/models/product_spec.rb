require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before do
    @product = build(:product)
  end

  describe '商品登録に関するテスト' do
    it '名前,画像,価格,ユーザーidがあれば有効であること' do
      expect(@product).to be_valid
    end

    it { should validate_presence_of :name }

    it { should validate_presence_of :picture }

    it { should validate_presence_of :price }

    it { should validate_numericality_of :price }
    
    it 'ユーザーidがなければ無効であること' do
      @product.user_id = nil
      expect(@product).to_not be_valid
    end
  end
end


