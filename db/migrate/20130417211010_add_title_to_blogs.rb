class AddTitleToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :title, :text
  end
end
