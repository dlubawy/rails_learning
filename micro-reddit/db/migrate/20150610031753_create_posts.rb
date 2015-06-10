class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :body
      t.string :subreddit
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end