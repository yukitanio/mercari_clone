Category.create!([
    {name: "ファッション"},
    {name: "シューズ"},
    {name: "バッグ"},
    {name: "スポーツ用品"},
    {name: "電子機器"},
    {name: "その他"},
  ])

User.create!(
    email: "test@example.com",
    password: "123456"
)

Profile.create!(
    name: "山田太郎",
    content: "迅速に対応します。",
    user_id: 1)

Product.create!(
    name: 'リュック', 
    price: 2000, 
    picture: open("app/assets/images/item_1.png"),
    category_ids: 3,
    user_id: 1)

Product.create!(
    name: 'バイク', 
    price: 12000, 
    picture: open("app/assets/images/item_2.png"),
    category_ids: 6,
    user_id: 1)

Product.create!(
    name: 'シューズ', 
    price: 6500, 
    picture: open("app/assets/images/item_3.png"),
    category_ids: 2,
    user_id: 1)

Product.create!(
    name: 'バッグ', 
    price: 8000, 
    picture: open("app/assets/images/item_4.png"),
    category_ids: 3,
    user_id: 1)

Product.create!(
    name: 'PC', 
    price: 80000, 
    picture: open("app/assets/images/item_5.png"),
    category_ids: 5,
    user_id: 1)

Product.create!(
    name: 'カメラ', 
    price: 20000, 
    picture: open("app/assets/images/item_6.png"),
    category_ids: 5,
    user_id: 1)

Product.create!(
    name: 'テニスラケット', 
    price: 19800, 
    picture: open("app/assets/images/item_7.png"),
    category_ids: 4,
    user_id: 1)

Product.create!(
    name: 'サッカーボール', 
    price: 5300, 
    picture: open("app/assets/images/item_8.png"),
    category_ids: 4,
    user_id: 1)

