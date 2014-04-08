class Link < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  validates :url, presence: true
  validates :description, presence: true

  def self.ordered
    Link.all.order(:votes.length)
  end

  def vote_count
    self.votes.length
  end
end
