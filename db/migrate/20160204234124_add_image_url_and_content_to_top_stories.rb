class AddImageUrlAndContentToTopStories < ActiveRecord::Migration
  def change
  	add_column :top_stories, :image_url, :string
  	add_column :top_stories, :content, :text
  end
end
