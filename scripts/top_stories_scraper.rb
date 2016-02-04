require 'nokogiri'
require 'open-uri'
require "sinatra/activerecord"
require './models/top_story'

url = "http://www.greatandhra.com/index.php"

page = Nokogiri::HTML(open(url))

top_stories = []

headlines = page.css('div.header')

top_stories = page.css('div.home_left_column')
				.css('ul.sortable-list')
				.css('li.sortable-item')
				.css('div.sortable-item_style_2')
				.css('div.content')
				.css('ul li a')

TopStory.delete_all

top_stories.each do |story|
	top_story = TopStory.create!(story: story.values[0], story_url: story.values[1])
end