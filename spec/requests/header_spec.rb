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
			#create blogs into the test db
			blogs= Array.new() 
			6.times do |i|
			 	 b = Blog.new(content: "my blog", title: "my title #{i}" )
			 	 b.save
			 	 blogs << b
			end
			#loop over the 6 blog entries
			blogs.each do |blog|
				# the 6th blog entry should not be displayed - it is the one we created first, we are displaying in descending order
				if blog.title.include? '0' then
					 it { should_not have_selector('ul.accordmobile li#blog ul li a', text: blog.title ) }
					 next
				end
				it { should have_selector('ul.accordmobile li#blog ul li a', text: blog.title ) }
			end
		  end

		  describe "faq" do
		  	it { should have_link('FAQ', href: faq_path) } 
		  end

		  
		  	it "click faq" do
		  		click_link('FAQ')
		  		page.should have_selector('h2', text: 'Frequently Asked Questions')
		  	end

		  	it { should have_link 'About', href: about_path }

		  	it "click about" do
		  		click_link('About')
		  		page.should have_selector('h2', text: 'About Me')
		  	end
		
	end

	describe "click link to contact us" do
		before { click_link "Contact" }
		it_should_behave_like "contact us page"
	end

end
