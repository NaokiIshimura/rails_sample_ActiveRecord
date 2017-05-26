class Day < ApplicationRecord
  belongs_to :address, primary_key: 'state', foreign_key: 'state'
end
