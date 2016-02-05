require 'nokogiri'
require 'open-uri'
require "sinatra/activerecord"
require './models/top_story'

def parse_story_details story

	page = Nokogiri::HTML(open(story.story_url))

	image = page.css('div.content').css('div.img_plc img')
	content = page.css('div.content p')
	
	[image, content]
end

def update_story(info, story)
	
	image = info[0]
	content = info[1]
	
	if image.count != 0
		story.image_url = image.attribute('src')
	end

	story.content = content.inner_text
	
	story.save
end

def get_all_top_stories

	stories = TopStory.all

	stories.each do |story|

		story_info = parse_story_details(story)
		update_story(story_info, story)

	end
end

get_all_top_stories