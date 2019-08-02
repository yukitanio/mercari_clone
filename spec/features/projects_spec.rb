require 'rails_helper'

RSpec.feature "Projects", type: :feature do

  scenario 'ユーザーは商品を出品する' do
    user = FactoryBot.create(:user)
    user.create_profile(name: "yamada")
    visit root_path
    click_link "ログイン"
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    fill_in "password_confirmation", with: user.password
    click_button "ログイン"
    expect {
      first(:link, '出品する').click
      attach_file "picture", "app/assets/images/item_1.png"
      fill_in "name", with: "リュック"
      fill_in "price", with: 2000
      click_button "出品する"
    }.to change(user.products, :count).by(1)
  end
end
