class Order < ApplicationRecord
    belongs_to :user
    belongs_to :item

    validates :status, presence: true
end
