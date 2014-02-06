class AddVisibleToBlogs < ActiveRecord::Migration
  def change
  	add_column	:blogs, :visible, :boolean, default: false, null: false
  end
end
