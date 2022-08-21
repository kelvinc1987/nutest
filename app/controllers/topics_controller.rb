require "json"
require "httparty"

class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    
  end

  def show
    @topic = Topic.find(params[:id])
    @response = HTTParty.get("https://api.twitter.com/2/tweets/search/recent?query=#{@topic.hashtag}&max_results=10", headers: {'Authorization' => 'Bearer AAAAAAAAAAAAAAAAAAAAAKYzgAEAAAAA5DiW076vJ07LGHOg9Rbn35ilBDA%3DYSfhghbTy9RjIduiPQED6GFDZsEXiL6cREnrdh1B0f4dZFgrk1'})
  end

  def usertopic                                                  
    @userhash = params.require(:usertopic)
    @response = HTTParty.get("https://api.twitter.com/2/tweets/search/recent?query=#{@userhash}&max_results=10", headers: {'Authorization' => 'Bearer AAAAAAAAAAAAAAAAAAAAAKYzgAEAAAAA5DiW076vJ07LGHOg9Rbn35ilBDA%3DYSfhghbTy9RjIduiPQED6GFDZsEXiL6cREnrdh1B0f4dZFgrk1'})
  end
end
