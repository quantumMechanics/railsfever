require 'spec_helper'
require 'requests/shared'


describe "Header" do

	let (:title) { "Rails Fever | Building Web Sites and Apps using Ruby on Rails" }
	

	subject { page }

	before { visit root_path }

	describe "Home" do
		it { should have_selector('title', text: title) }
		it { should have_selector('header') }
		it { should have_link 'Home', href: root_path}

		
		describe "Blog link exist" do
			it { should have_link 'Blog', href: blogs_path }
			# it should display the first 5 blog posts
		end

		describe "Blog list elements" do			
		  it "this it should be removed when pending is removed" do
			pending "this test is passing but it should not be"
			blogs= Array.new() 
			6.times do |i|
			 	 b = Blog.new(content: "my blog", title: 'my title')
			 	 b.save
			 	 blogs << b
			end
			

			#get the first 5 blog posts
			blogs.each do |blog|
				#save_and_open_page	
				it { should have_selector('ul.accordmobile li#blog ul li a', text: blog.title, href: blog_path(blog.id)) }
			end
		  end
		end
		
		
	end

	describe "click link to contact us" do
		before { click_link "Contact" }
		it_should_behave_like "contact us page"
	end

end
