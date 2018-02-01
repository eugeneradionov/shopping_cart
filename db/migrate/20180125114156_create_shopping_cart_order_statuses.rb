class CreateShoppingCartOrderStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
