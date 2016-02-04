$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'models/top_story'

set :database_file, "config/database.yml"

get '/' do
  'Hello world!'
end

get '/top_stories' do
	content_type :json
	@stories = TopStory.all
	@stories.to_json
end