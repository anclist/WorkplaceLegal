class Request < ApplicationRecord
  has_and_belongs_to_many :services
  validates :name, presence: true
end
