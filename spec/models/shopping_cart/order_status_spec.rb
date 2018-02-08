require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderStatus, type: :model do
    it { is_expected.to have_many(:orders) }
    it { is_expected.to validate_presence_of(:status) }
  end
end