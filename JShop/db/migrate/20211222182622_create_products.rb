class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10
      t.integer :favorites, default: 0
      t.integer :sales, default: 0
      t.text :description
      t.string :image_dir
      t.string :added_time
      t.references :user, null: false, foreign_key: true
      t.string :seller_username

      t.timestamps
    end
  end
end
