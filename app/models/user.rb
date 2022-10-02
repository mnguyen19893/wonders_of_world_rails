class User < ApplicationRecord
  has_many :places

  has_many :user_places
  has_many :places, through: :user_places

  validates :username, :email, :password, presence: true

end
