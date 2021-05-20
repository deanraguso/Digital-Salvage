class User < ApplicationRecord
  belongs_to :address
  has_many :items
  has_and_belongs_to_many :inboxes
  has_many :messages, dependent: :destroy
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
