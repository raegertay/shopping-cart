# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@gmail.com', password: 'password')

Brand.create(name: 'Kat Von D Beauty')
Brand.create(name: 'Tarte')
Brand.create(name: 'Pixi')
Brand.create(name: 'Sephora')

Product.create(name: 'Clay Mask', brand_id: 4, cost_price: 3 , selling_price: 11, stock: 10, images_attributes: [{url: 'https://cdn.filestackcontent.com/vSvMNomWQdufESEc2wr9', position: 1}], description: 'A line of face masks enriched with natural clay to address targeted skincare needs.')
Product.create(name: 'Skintreat Duo', brand_id: 3, cost_price: 22 , selling_price: 59, stock: 10, images_attributes: [{url: 'https://cdn.filestackcontent.com/Yl6SjUPSSCbYMthRPGQP', position: 1}], description: 'A limited-edition duo of Pixi Beauty cult favourites for smoother, more luminous skin.' )
Product.create(name: 'Everlasting Liquid Lipstick', brand_id: 1, cost_price: 15 , selling_price: 31, stock: 10, images_attributes: [{url: 'https://cdn.filestackcontent.com/kcv6I7JTFmdNHjacHCit', position: 1}], description: 'A long-wear, high-pigment liquid lipstick with a smooth, matte finish and all-day, lightweight comfort.' )
Product.create(name: 'Lock-It Concealer Crème', brand_id: 1, cost_price: 19, selling_price: 40, stock: 10, images_attributes: [{url: 'https://cdn.filestackcontent.com/v6LlfC1DRiexX6l0SFzm', position: 1}], description: 'A super-versatile, rich and creamy concealer with 24-hour wear and instant full coverage.' )
Product.create(name: 'Amazonian Finishing Powder', brand_id: 2, cost_price: 20, selling_price: 49, stock: 10, images_attributes: [{url: 'https://cdn.filestackcontent.com/NYfphF2R2GJRFKk1fFzV', position: 1}], description: 'This finishing powder keeps makeup in place without ever appearing chalky and mattifies skin by removing excess surface oil.' )
Product.create(name: 'Amazonian Lipstick', brand_id: 2, cost_price: 8, selling_price: 26, stock: 10, images_attributes: [{url: 'https://cdn.filestackcontent.com/F7o9ZmS9aI1cVoVMAnVg', position: 1}], description: 'Each skin-flattering shade is enriched with sustainably harvested cupuacu and murumuru butters to deliver intense moisture and help restore and soothe even mature lips.' )
