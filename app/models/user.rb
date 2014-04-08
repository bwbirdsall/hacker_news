class User < ActiveRecord::Base
  has_many :comments
  has_many :links
  validates :username, presence: true, uniqueness: true
end
