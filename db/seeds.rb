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
    postal_code: "1500041",
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

# Commodity.create(
#   genre_id: 1,
#   name: "チョコレートケーキ",
#   opinion: "香り高いスイートチョコを使用しています。しっとり濃厚で、贅沢なスイーツ。",
#   non_taxed_price: 2500,
#   image: File.open("./app/assets/images/david-holifield-kPxsqUGneXQ-unsplash.jpg"),
#   sale_status: 0
# )
[
  [1, "贅沢チョコケーキ", "香り高いスイートチョコを使用しています。しっとり濃厚で、贅沢なスイーツ。", 4000, File.open("./app/assets/images/david-holifield-kPxsqUGneXQ-unsplash.jpg")],
  [1, "苺とヨーグルトのケーキ", "さっぱりとしているので、一人で全部いけちゃいます。", 4000, File.open("./app/assets/images/IMG_3457.jpg")],
  [1, "まるごとみかんのロールケーキ", "まるごとみかんをたくさん使用しています。可愛い断面を見てあげて。", 2500, File.open("./app/assets/images/IMG_3459.jpg")],
  [1, "ショコラロールケーキ", "ふわふわ生地、甘すぎないショコラ。さくらんぼで可愛さ2倍。", 2500, File.open("./app/assets/images/IMG_3460.jpg")],
  [1, "完熟いちごのロールケーキ", "いちばんおしゃれでかわいいケーキ。女子会や自分へのご褒美におすすめ。", 3000, File.open("./app/assets/images/IMG_3463.jpg")],
  [3, "焼き菓子アソート", "素材にこだわった焼き菓子を少しずつ。食べ比べは幸せよね。", 3000, File.open("./app/assets/images/IMG_3464.jpg")],
  [4, "カラフルグミ", "スペイン産の原色系グミ。歯ごたえがあって、食べ出したら止まらない。", 800, File.open("./app/assets/images/sweets9.jpg")],
  [4, "なつかしドロップス", "懐かしい味の飴。私はハッカが好き。", 800, File.open("./app/assets/images/sweets10.jpg")],
  [2, "マハカラのうれしいプリン", "たまごにこだわった濃厚プリンとほろ苦カラメルが相性ばつぐん。6個セット", 2600, File.open("./app/assets/images/sweets11.jpg")],
  [4, "ハッピーグミ", "ちょっと似てるけど違うよ！！周りのパウダーはすっぱめ。80g×4袋", 800, File.open("./app/assets/images/sweets12.jpg")],
  [2, "チョコレートぷりん", "ほろ苦い大人のお味。休日に一人でこっそり食べたい。6個セット", 2800, File.open("./app/assets/images/sweets13.jpg")],
  [2, "マンゴープリン", "完熟マンゴーがとろけるしあわせぷりん。6個セット", 2800, File.open("./app/assets/images/sweets14.jpg")]
].each do |genre_id, name, opinion, non_taxed_price, img|
  Commodity.create!(
    { genre_id: genre_id, name: name, opinion: opinion, non_taxed_price: non_taxed_price, image: img}
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