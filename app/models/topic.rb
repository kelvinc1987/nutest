class Topic < ApplicationRecord
    has_many :tweets

    def refresh
        Tweet.all.each do |tweet| 
          tweet.destroy
        end
    
        topics = Topic.all
        topics.each do |topic|
          client = Twitter::REST::Client.new do |config|
            config.consumer_key = "ikeXKQqnP6L8sev0SYUJnLNuB"
            config.consumer_secret = "HhH6vUprLph1CaZUgarNGnHrEQs2KpiiY3IdLLYJX5COwgnmXp"
            config.access_token = "2268351356-bftRqhHSre3bcmIoFJt2zy112yqa392EqrIKHwa"
            config.access_token_secret = "lb2z9IukWc8BYjn2b9qJJoxCVp9rrkFeGqhZeLR0QI4EI"
          end
      
          tweets = client.search("\##{topic.hashtag}", result_type: "recent", include_entities: true).take(10)
          tweets.each do |tweet|
            t = Tweet.new
            t.json = tweet.to_json
            t.hashtag = topic.hashtag
            t.topic_id = topic.id
            t.save!
          end
        end
      end
end
