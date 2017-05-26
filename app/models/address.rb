class Address < ApplicationRecord
  has_one :fee
  has_many :day, primary_key: 'state', foreign_key: 'state'
end
