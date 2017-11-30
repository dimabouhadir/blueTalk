class Channel < ApplicationRecord
  has_many :users
  belongs_to :piconet, optional: true

  validates :channel_name, presence: true
  validates :number_of_users, presence: true
end
