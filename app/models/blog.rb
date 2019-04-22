class Blog < ApplicationRecord
  has_and_belongs_to_many :services
  belongs_to :user
  validates :title, :content, presence: true
  mount_uploader :picture, PictureUploader
end
