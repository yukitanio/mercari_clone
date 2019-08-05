require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe '#index' do
    it '正常にレスポンスを返すこと' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#show' do
    before do
      @product = FactoryBot.create(:product)
    end
    it '正常にレスポンスを返すこと' do
      get :show, params: {id: @product.id}
      expect(response).to be_success
    end
  end

  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @product_params = FactoryBot.attributes_for(:product)
    end

    it 'ログイン済みのユーザーは商品を出品できること' do
      sign_in @user
      expect {
      post :create, params: {product: @product_params}
      }.to change(@user.products, :count).by(1)
    end

    it 'ログインしていないユーザーは商品を出品できないこと' do
      expect {
      post :create, params: {product: @product_params}
      }.to change(@user.products, :count).by(0)
    end

    it 'ログインしていないユーザーはログイン画面にリダイレクトされること' do
      post :create, params: {product: @product_params}
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end
