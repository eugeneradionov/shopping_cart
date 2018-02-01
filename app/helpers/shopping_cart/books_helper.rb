module ShoppingCart
  module BooksHelper
    def book_price(book)
      "€#{book.price}"
    end

    def book_dimensions
      "H:#{@book.height}\" x W:#{@book.width}\" x D:#{@book.depth}\""
    end

    def book_gallery_image(id)
      begin
        src = @book.image_urls[id].url
        "<div class= \"img-link\"><img src= \"#{src}\"></div>"
      rescue NoMethodError
        ''
      end
    end

    def book_review_date(review)
      review.created_at.strftime('%d/%m/%y')
    end

    def book_approved_reviews_count
      count = @book.reviews.approved.count
      count.zero? ? '' : "(#{count})"
    end

    def book_review_avatar_letter(review)
      review.user.email[0].upcase
    end
  end
end
