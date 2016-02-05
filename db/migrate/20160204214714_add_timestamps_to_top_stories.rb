class AddTimestampsToTopStories < ActiveRecord::Migration
  def change
  	add_column :top_stories, :created_at, :datetime
  	add_column :top_stories, :updated_at, :datetime
  end
end
