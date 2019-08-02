require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品登録に関するテスト' do
    it '名前,画像,価格,ユーザーidがあれば有効であること' do
      expect(@product).to be_valid
    end
  
    it '名前がなければ無効であること' do
      @product.name = nil
      expect(@product).to_not be_valid
    end
  
    it '画像がなければ無効であること' do
      @product.picture = nil
      expect(@product).to_not be_valid
    end
  
    it '価格がなければ無効であること' do
      @product.price = nil
      expect(@product).to_not be_valid
    end
  
    it '価格が数値以外だと無効であること' do
      @product.price = 'test'
      expect(@product).to_not be_valid
    end
  
    it '商品説明が250文字以内だと有効であること' do
      @product.content = 'a'*250
      expect(@product).to be_valid
    end
  
    it '商品説明が251文字以上だと無効であること' do
      @product.content = 'a'*251
      expect(@product).to_not be_valid
    end
  
    it 'ユーザーidがなければ無効であること' do
      @product.user_id = nil
      expect(@product).to_not be_valid
    end
  end
end


