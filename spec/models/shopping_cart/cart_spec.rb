require 'rails_helper'

module ShoppingCart
  RSpec.describe Cart, type: :model do
    it { is_expected.to have_many(:order_items) }
  end
end
