#config: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customers = Customer.create!([
  {
    email: 'xxx@gmail.com',
    password: "kamoniku",
    first_name: '太郎',
    last_name: '山田',
    first_name_ruby: 'たろう',
    last_name_ruby: 'やまだ',
    post_code: '5551234',
    address: '東京',
    telephone_number: '09012345678',
    is_deleted: false,
  }])

categories = Category.create!([
  { name: 'ケーキ' }, 
  { name: '焼き菓子' }, 
  { name: 'プリン' }, 
  { name: 'キャンディ' }
  ])

products = Product.create!([
  {
    name: 'cake1', 
    discription: 'good', 
    image: File.open("./app/assets/images/cake.jpeg"), 
    category_id: categories.first.id, 
    is_sold: true, 
    price: 500
  },
  {
    name: 'cake2', 
    discription: 'good', 
    image: File.open("./app/assets/images/cake.jpeg"), 
    category_id: categories.first.id, 
    is_sold: true, 
    price: 500
  },
  {
    name: 'cake3',
    discription: 'good', 
    image: File.open("./app/assets/images/cake.jpeg"), 
    category_id: categories.last.id, 
    is_sold: true,
    price: 500
  },
  {
    name: 'cake4', 
    discription: 'good', 
    image: File.open("./app/assets/images/cake.jpeg"), 
    category_id: categories.last.id, 
    is_sold: true, 
    price: 500
  }])

orders = Order.create!([
  {
    customer_id: customers.first.id,
    post_code: "5551234", 
    address: "大阪",
    address_name: "山田花子", 
    postage: 800, 
    total_price: 2000, 
    payment_method: 1, 
    status: 1
  }])
  
OrderDetail.create!(order_id: orders.first.id, product_id: products.first.id, quantity: 3, price: 1500, making_status: 0)