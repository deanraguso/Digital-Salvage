class Item < ApplicationRecord
    belongs_to :order
    belongs_to :user
    has_many_attached :images, service: :amazon
end
