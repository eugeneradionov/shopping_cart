module ShoppingCart
  module HomeHelper
    def product_first_sentence(product)
      product.description[/^(.*?)[.?!]/]
    end
  end
end
