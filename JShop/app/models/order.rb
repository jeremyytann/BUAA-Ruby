class Order < ApplicationRecord
    has_many :s_orders, dependent: :destroy

    scope :filter_by_status, -> (status) { where status: status }
end
