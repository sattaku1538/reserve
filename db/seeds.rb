#config: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "kamoniku@gmail.com",
  password: "kamoniku"
  )

15.times do |n|
  Customer.create!(
    email: "#{n + 1}@gmail.com",
    password: "kamoniku",
    first_name: "太郎#{n + 1}",
    last_name: '山田',
    first_name_ruby: 'たろう',
    last_name_ruby: 'やまだ',
    post_code: '5551234',
    address: '東京',
    telephone_number: '09012345678',
    is_deleted: false,
  )
end

categories = Category.create!([
  { name: 'ケーキ' }, 
  { name: '焼き菓子' }, 
  { name: 'プリン' }, 
  { name: 'キャンディ' }
  ])

15.times do |n|
  Product.create!(
    name: "cake#{n + 1}", 
    discription: 'good', 
    image: File.open("./app/assets/images/cake.jpeg"), 
    category_id: categories.first.id, 
    is_sold: true, 
    price: 500
  )
end
 
Customer.all.each do |customer|
  customer.orders.create!(
    post_code: "5551234", 
    address: "大阪",
    address_name: customer.last_name + customer.first_name, 
    postage: 800, 
    total_price: 2000, 
    payment_method: 1, 
    status: 1
  )
end

Product.all.each do |product|
  product.order_details.create!(
    order_id: 1,
    quantity: 3,
    price: product.price * 3,
    making_status: 0,
    )
end
  
  Shipping.create!(
   address: '東京',
   address_name: 'テスト太郎',
   post_code: "0000000"
)