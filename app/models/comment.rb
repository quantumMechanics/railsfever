class Comment < ActiveRecord::Base
  attr_accessible :blog_id, :content
  belongs_to :blog

end
