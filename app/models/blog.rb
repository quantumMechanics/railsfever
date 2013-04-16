class Blog < ActiveRecord::Base
  attr_accessible :content
  has_many :comments
end
