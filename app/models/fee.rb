class Fee < ApplicationRecord
  belongs_to :address
  belongs_to :addr, class_name: 'Address', foreign_key: 'address_id'
end
