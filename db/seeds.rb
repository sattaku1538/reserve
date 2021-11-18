#config: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create!([{ name: 'ケーキ' }, { name: '焼き菓子' }, { name: 'プリン' }, { name: 'キャンディ' }])

Product.create!(name: 'cake1', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: categories.first.id, is_sold: true, price: 500)
Product.create!(name: 'cake2', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: categories.first.id, is_sold: true, price: 500)
Product.create!(name: 'cake3', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: categories.last.id, is_sold: true, price: 500)
Product.create!(name: 'cake4', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: categories.last.id, is_sold: true, price: 500)