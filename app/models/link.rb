class Link < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  validates :url, presence: true
  validates :description, presence: true
end
