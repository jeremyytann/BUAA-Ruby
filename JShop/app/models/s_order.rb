class SOrder < ApplicationRecord
  belongs_to :order

  scope :filter_by_status, -> (status) { where status: status }
end
