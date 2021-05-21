class Item < ApplicationRecord
    has_one :order
    belongs_to :user
    has_many_attached :images, service: :amazon

    # Validation
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :condition, presence: true
    validates :description, presence: true
    validates :part_type, presence: true
end
