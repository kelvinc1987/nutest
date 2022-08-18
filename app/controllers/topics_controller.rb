class TopicsController < ApplicationController
  def index
    @tweets = Topic.find(params[:id]).tweets
    render json: @tweets
  end
end
