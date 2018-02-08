module ShoppingCart
  module BooksHelper
    def book_price(book)
      "€#{book.price}"
    end

    def book_dimensions
      "H:#{@product.height}\" x W:#{@product.width}\" x D:#{@product.depth}\""
    end

    def book_gallery_image(id)
      begin
        src = @product.image_urls[id].url
        "<div class= \"img-link\"><img src= \"#{src}\"></div>"
      rescue NoMethodError
        ''
      end
    end

    def book_review_date(review)
      review.created_at.strftime('%d/%m/%y')
    end

    def book_approved_reviews_count
      count = @product.reviews.approved.count
      count.zero? ? '' : "(#{count})"
    end

    def book_review_avatar_letter(review)
      review.user.email[0].upcase
    end
  end
end
