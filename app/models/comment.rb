class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :blog
  validates :blog_id, presence: true
  validates :content, presence: true
  default_scope order: 'comments.created_at DESC'
end
