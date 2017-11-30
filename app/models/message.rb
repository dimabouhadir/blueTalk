class Message < ApplicationRecord
  belongs_to :piconet
  validates :content, presence:true, length: {maximum: 150}
  validates :source, presence: true
  validates :destination, presence: true
end
