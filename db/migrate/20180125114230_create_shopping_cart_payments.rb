class CreateShoppingCartPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_payments do |t|
      t.string :card_number
      t.string :name_on_card
      t.string :mm_yy
      t.integer :cvv

      t.timestamps
    end
  end
end
