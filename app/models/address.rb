class Address < ApplicationRecord
    has_many :users

    # Validation
    validates :country, presence: true, length: {minimum: 3}
    validates :state, presence: true
    validates :postal_code, presence: true
    validates :street_address, presence: true
end
