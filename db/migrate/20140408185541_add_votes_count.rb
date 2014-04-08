class AddVotesCount < ActiveRecord::Migration
  def change
    add_column :links, :votes_count, :integer, :default => 0

    Link.reset_column_information
    Link.all.each do |p|
      p.update_attribute :votes_count, p.votes.length
    end
  end
end
