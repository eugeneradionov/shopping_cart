# This migration comes from shopping_cart (originally 20180125100704)
class CreateShoppingCartBillingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
