class CreateTables < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.text :description
    end

    create_table :comments do |t|
      t.integer :link_id
      t.integer :user_id
      t.text :text
    end

    create_table :users do |t|
      t.string :username
    end

    create_table :votes do |t|
      t.integer :link_id
    end
  end
end
