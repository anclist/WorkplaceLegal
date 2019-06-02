class Service < ApplicationRecord
  has_and_belongs_to_many :blogs
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :requests
  validates :name, presence: true
  validates :description, presence: true
end
