# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pay_categories=PayCategory.create(name:"食費",color:"#6927FF")
pay_categories=PayCategory.create(name:"交通費",color:"#32EEFF")
pay_categories=PayCategory.create(name:"趣味",color:"#FF5F17")
pay_categories=PayCategory.create(name:"クレカ",color:"#FF367F")
pay_categories=PayCategory.create(name:"通信費",color:"#2DFF57	")
pay_categories=PayCategory.create(name:"住居費",color:"#30F9B2	")
pay_categories=PayCategory.create(name:"健康",color:"#0000BB")
pay_categories=PayCategory.create(name:"交際費",color:"#FFD700")
pay_categories=PayCategory.create(name:"生活費",color:"#FF1493	")



