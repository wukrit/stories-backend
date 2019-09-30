class ArticleKeyword < ApplicationRecord
  belongs_to :topic
  belongs_to :article

  def assign_topic(word)
    if Topic.exists?(title: word)
        self.topic_id = Topic.find_by(title: word).id
    else
        new_topic = Topic.create(title: word)
        self.topic_id = new_topic.id
    end
  end
end
