class Blog < ActiveRecord::Base
  attr_accessible :content
  has_many :comments, dependent: :destroy
  validates :content, presence: true
end
