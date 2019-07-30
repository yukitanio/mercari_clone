require 'rails_helper'

RSpec.describe Product, type: :model do

before do
  @product = FactoryBot.create(:product)
end

  it "Product　nameは空だとエラー" do
    product = @product
    product.name = nil
    expect(product).not_to be_valid
  end

  it "Product　pictureは空だとエラー" do
    product = @product
    product.picture = nil
    expect(product).not_to be_valid
  end

  it "Product　priceは空だとエラー" do
    product = @product
    product.price = nil
    expect(product).not_to be_valid
  end

  it "Product　contentは251文字以上だとエラー" do
    product = @product
    product.content = "a"*251
    expect(product).not_to be_valid
  end

end

