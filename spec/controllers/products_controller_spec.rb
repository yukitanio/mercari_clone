require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

        it 'indexへのリクエストが成功する' do
            get :index
            expect(response).to have_http_status(:success)
        end
end
