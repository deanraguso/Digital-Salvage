class Item < ApplicationRecord
    has_one :order
    belongs_to :user
    has_many_attached :images, service: :amazon
end
