# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  Customer.create(
    email: "test#{n + 1}@test",
    password: "test#{n + 1}@test",
    last_name: "山田",
    first_name: "太郎#{n + 1}",
    kana_last_name: "ヤマダ",
    kana_first_name: "タロウ#{n + 1}",
    postal_code: "15000",
    phone_number: "0000000000#{n + 1}",
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア24階"
  )
end

Customer.all.each do |customer|
  customer.destinations.create(
    postal_code: "1600022",
    place: "東京都新宿区新宿2-5-10成信ビル 4階",
    name: "test"
  )
end

Genre.create([{name: "ケーキ"}, {name: "プリン"}, {name: "焼き菓子"}, {name: "キャンディ"}])

4.times do |n|
  Commodity.create(
    genre_id: 1,
    name: "ケーキ#{n + 1}",
    opinion: "とてもおいしいケーキ#{n + 1}",
    non_taxed_price: 2500,
    image: File.open("./app/assets/images/david-holifield-kPxsqUGneXQ-unsplash.jpg"),
    sale_status: 0
  )
end

2.times do |n|
  CartItem.create(
    customer_id: 1,
    commodity_id: "#{n + 1}",
    quantity: 2
  )
end

Admin.create(
  email: "admin@test",
  password: "admin@test"
)