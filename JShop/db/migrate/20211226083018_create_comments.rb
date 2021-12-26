class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :s_order, null: false, foreign_key: true
      t.text :description
      t.integer :rating
      t.integer :seller_id

      t.timestamps
    end
  end
end
