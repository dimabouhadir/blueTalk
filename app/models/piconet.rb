class Piconet < ApplicationRecord
  belongs_to :channel

  has_many :users
  has_many :messages
end
