class Product < ApplicationRecord
    has_one_attached :image_dir
    validates :name, :price, :description, :image_dir,  presence: true
    belongs_to :user
end
