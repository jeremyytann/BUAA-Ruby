class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.references :s_order, null: false, foreign_key: true
      t.string :postman_name

      t.timestamps
    end
  end
end
