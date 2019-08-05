require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  before do
    @user = create(:user)
  end

  describe '#index' do
    it 'ログインしていない場合はログイン画面にリダイレクトする' do
      get :index
      expect(response).to redirect_to "/users/sign_in"
    end
  end

  describe '#show' do
    it 'ログインしていない場合はログイン画面にリダイレクトする' do
      get :show, params: {id: @user.id}
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end
