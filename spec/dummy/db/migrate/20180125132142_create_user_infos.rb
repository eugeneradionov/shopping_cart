class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.references :shipping_address,
                   foreign_key: { to_table: :shopping_cart_shipping_addresses }
      t.references :billing_address,
                   foreign_key: { to_table: :shopping_cart_billing_addresses }
      t.references :payment,
                   foreign_key: { to_table: :shopping_cart_payments }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
