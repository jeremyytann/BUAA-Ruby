class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :deal_sum
      t.string :delivery_address
      t.string :delivery_name
      t.string :delivery_phone
      t.string :order_status

      t.timestamps
    end
  end
end
