require "json"
require "httparty"
require "dotenv"


class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    
  end

  def show
    key = ENV['MY_BEARER_TOKEN']
    @topic = Topic.find(params[:id])
    @response = HTTParty.get("https://api.twitter.com/2/tweets/search/recent?query=#{@topic.hashtag}&max_results=10", headers: {'Authorization' =>"Bearer #{key}"})
  
  end

  def usertopic 
    key = ENV['MY_BEARER_TOKEN']
    @userhash = params.require(:usertopic)
    @response = HTTParty.get("https://api.twitter.com/2/tweets/search/recent?query=#{@userhash}&max_results=10", headers: {'Authorization' => "Bearer #{key}"})
  end
end
