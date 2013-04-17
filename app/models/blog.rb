class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :comments, dependent: :destroy
  validates :content, presence: true
  default_scope order: 'blogs.created_at DESC'
end
