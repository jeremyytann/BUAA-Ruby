class Product < ApplicationRecord
    has_one_attached :image_dir
    validates :name, :price, :description, :image_dir,  presence: true
    belongs_to :user

    has_many :favorites, dependent: :destroy
    has_many :carts, dependent: :destroy
    has_many :s_orders, dependent: :destroy
end
