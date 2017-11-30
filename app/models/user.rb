class User < ApplicationRecord
  belongs_to :piconet, optional: true
  validates :phone_number, length: {is: 8}, presence: true, uniqueness: true
  validates :name, presence: true
end
