class User < ApplicationRecord
  belongs_to :channel
  validates :phone_number, length: {is: 8}, presence: true, uniqueness: true
  validates :name, presence: true
end
