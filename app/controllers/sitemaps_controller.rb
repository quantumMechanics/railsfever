class SitemapsController < ApplicationController
	respond_to :xml

	def index
		@static_paths = [contact_path, about_path, blogs_path]
		@blogs = Blog.where(visible:true)
		#then render the view template
	end
end