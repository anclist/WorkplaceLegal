class Video < ApplicationRecord
  has_and_belongs_to_many :services
  validates :title, :url, presence: true
  validates_format_of :url, :with => /(youtu\.be\/|youtube\.com\/(watch\?(.*&)?v=|(embed|v)\/))([^\?&"'>]+)/, :on => :create
end
