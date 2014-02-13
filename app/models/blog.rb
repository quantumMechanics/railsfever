class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  attr_accessible :content, :title, :visible

  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :title, presence: true
  validates :slug, presence: true

  default_scope order: 'blogs.created_at DESC'

  def previous_post
  	self.class.first(conditions: ["id < ?", id], order: "id desc")
  end

  def next_post
  	self.class.last(conditions: ["id > ?", id], order: "id asc")
  end
end
