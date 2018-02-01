class ProductsController < ApplicationController
  load_and_authorize_resource
  def index
    @products = Product.all
  end

  def show
    @order_item = OrderItem.new
  end
end
