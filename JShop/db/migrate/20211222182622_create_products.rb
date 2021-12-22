class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10
      t.integer :favorites
      t.integer :sales
      t.text :description
      t.string :image_dir
      t.bigint :added_time

      t.timestamps
    end
  end
end
