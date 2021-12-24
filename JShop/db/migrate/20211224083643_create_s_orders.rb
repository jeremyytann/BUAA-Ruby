class CreateSOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :s_orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :price
      t.references :order, null: false, foreign_key: true
      t.integer :seller_id
      t.string :status

      t.timestamps
    end
  end
end
