require 'rails_helper'

RSpec.describe TopPagesController, type: :controller do
    
    it '正常にレスポンスを返すこと' do
        get :index
        expect(response).to be_success
    end
end
