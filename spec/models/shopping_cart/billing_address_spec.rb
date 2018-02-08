require 'rails_helper'

module ShoppingCart
  RSpec.describe BillingAddress, type: :model do
    it { is_expected.to have_many(:orders) }
  end
end
