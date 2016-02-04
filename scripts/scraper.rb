require 'nokogiri'
require 'open-uri'


url = "http://www.greatandhra.com/index.php"

page = Nokogiri::HTML(open(url))

top_stories = []

headlines = page.css('div.header')
#puts headlines
top_stories = page.css('div.home_left_column')
				.css('ul.sortable-list')
				.css('li.sortable-item')
				.css('div.sortable-item_style_2')
				.css('div.content')
				.css('ul li a')

top_stories.each do |story|
	File.open('/vagrant/scripts/scraper.txt', 'a')  do |f|
		f << story.values[0] + '\n'
		f << story.values[1] + '\n'
	end
end