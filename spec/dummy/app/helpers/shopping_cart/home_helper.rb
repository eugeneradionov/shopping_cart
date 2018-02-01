module ShoppingCart
  module HomeHelper
    def product_first_sentence(book)
      book.description[/^(.*?)[.?!]/]
    end
  end
end
