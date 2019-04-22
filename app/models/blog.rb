class Blog < ApplicationRecord
  has_and_belongs_to_many :services
  validates :title, :content, presence: true
end
