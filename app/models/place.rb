class Place < ApplicationRecord
  belongs_to :user
  belongs_to :type

  has_many :user_places
  has_many :users, through: :user_places
end
