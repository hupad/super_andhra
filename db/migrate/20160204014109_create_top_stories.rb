class CreateTopStories < ActiveRecord::Migration
  def change
  	create_table :top_stories do |t|
  		t.string :story
  		t.string :story_url
  	end
  end
end
