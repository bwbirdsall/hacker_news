class AddTimestamps < ActiveRecord::Migration
  def change
    add_column(:links, :created_at, :datetime)
    add_column(:links, :updated_at, :datetime)
    add_column(:comments, :created_at, :datetime)
    add_column(:comments, :updated_at, :datetime)
  end
end
