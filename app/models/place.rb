class Place < ApplicationRecord
  belongs_to :user
  belongs_to :type

  has_many :user_places
  has_many :users, through: :user_places

  validates :name, presence: true
  validates :latitude, numericality: true
  validates :longitude, numericality: true
  validates :build_in_year, numericality: { only_integer: true }
end
