require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = create(:user)
    @product = create(:product)
  end

  it 'ユーザーはいいね!していない商品にいいね!することができる' do
    like = @user.likes.build(product_id: @product.id)
    expect(like).to be_valid
  end
      
  it 'ユーザーはいいね!した商品に再度いいね!することはできない' do
    like = @user.likes.create(product_id: @product.id)
    other_like = @user.likes.build(product_id: @product.id)
    expect(other_like).to_not be_valid
  end
end
