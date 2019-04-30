class Video < ApplicationRecord
  has_and_belongs_to_many :services
  belongs_to :user
  validates :title, :url, presence: true
end
