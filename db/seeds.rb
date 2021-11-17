# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 現状シード作れない（image_idが必要？）
Product.create(name: 'cake1', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: 1, is_sold: true, price: 500)
Product.create(name: 'cake2', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: 2, is_sold: true, price: 500)
Product.create(name: 'cake3', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: 3, is_sold: true, price: 500)
Product.create(name: 'cake4', discription: 'good', image: File.open("./app/assets/images/cake.jpeg"), category_id: 4, is_sold: true, price: 500)

Category.create(name: 'ケーキ')
Category.create(name: '焼き菓子')
Category.create(name: 'プリン')
Category.create(name: 'キャンディ')