class User < ApplicationRecord
  has_many :created_places, foreign_key: 'user_id', class_name: 'Place'

  has_many :user_places
  has_many :places, through: :user_places

  validates :username, :email, :password, presence: true

end
