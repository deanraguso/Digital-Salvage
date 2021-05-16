class Message < ApplicationRecord
  belongs_to :user
  belongs_to :inbox

  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }
end
