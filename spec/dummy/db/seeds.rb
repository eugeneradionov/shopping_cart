delivery1 = ShoppingCart::Delivery.create!(method: 'Delivery Next Day!', days_from: 3, days_to: 7, price: 5)
delivery2 = ShoppingCart::Delivery.create!(method: 'Pick Up In-Store', days_from: 5, days_to: 20, price: 0)
delivery3 = ShoppingCart::Delivery.create!(method: 'Expressit', days_from: 2, days_to: 3, price: 15)

ShoppingCart::Coupon.create!(code: '1q2w3e', discount: 1.00)
ShoppingCart::Coupon.create!(code: 'e3w2q1', discount: 10.00)
ShoppingCart::Coupon.create!(code: 'q1w2e3', discount: 15.00)
ShoppingCart::Coupon.create!(code: 'qwerty', discount: 5.00)

ShoppingCart::OrderStatus.create!(status: 'Waiting for Processing')
ShoppingCart::OrderStatus.create!(status: 'In Progress')
ShoppingCart::OrderStatus.create!(status: 'In Delivery')
ShoppingCart::OrderStatus.create!(status: 'Delivered')
ShoppingCart::OrderStatus.create!(status: 'Canceled')

user1 = User.create!(email: 'email@example.com', password: 'qwertyQ2')

cart1 = ShoppingCart::Cart.create!(user_id: user1)

product1 = Product.create!(title: 'Android Application Development Cookbook - Second Edition',
                          price: 32.99)
product2 = Product.create!(title: 'Swift Programming: The Big Nerd Ranch Guide 2nd Edition',
                          price: 32.99)

ShoppingCart::OrderItem.create!(product_id: product1.id, cart_id: cart1.id, quantity: 1)
