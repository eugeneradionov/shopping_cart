# ShoppingCart
Simple cart engine witch checkout and ability to review orders

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'shopping_cart'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install shopping_cart
```

## Configuration
* Run `rake shopping_cart:install:migrations` to copy engine migrations to your application
* Create initializer in your application: `initializers/shopping_cart.rb`
* Setup `Product` and `User` classes inside the initializer:
  ```ruby
  ShoppingCart.product_class = 'Product'
  ShoppingCart.user_class = 'User'
  ```
* Also you need to create `UserInfo` model
* Declare associations in the `User` model in your application:
  ```ruby
  has_one :cart, class_name: 'ShoppingCart::Cart'
  has_one :user_info
  has_many :orders, class_name: 'ShoppingCart::Order'
  ```
* Mount engine in your `routes.rb`
  ```ruby
  mount ShoppingCart::Engine => '/cart'
  ```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
