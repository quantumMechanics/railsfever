class SitemapsController < ApplicationController
	#caches_page :index
	def index
		@static_paths = [contact_path, about_path, blogs_path]
		@blogs = Blog.all
		respond_to do |format|
			format.xml
		end
	end
end