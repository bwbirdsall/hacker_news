class Link < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  validates :url, presence: true
  validates :description, presence: true

  def age_score
    score = 10 - (Date.today - Date.parse(self.created_at.to_s)).to_i
    if score < 0
      score = 0
    end
    score
  end

  def self.sorted
    array = self.all
    array.each do |link|
      link.score = link.votes_count + link.age_score
    end
    array.sort! { |x,y| y.score <=> x.score }
  end
end
