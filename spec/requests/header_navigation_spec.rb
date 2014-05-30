require 'spec_helper'

describe "Header" do

	subject { page }

	before { visit root_path }

	describe "Home" do
		it { should have_selector('header') }
		it { should have_link 'Home', href: root_path}

		
		describe "Blog link exist" do
			it { should have_link 'Blog', href: blogs_path }
			# it should display the first 5 blog posts
		end

		describe "Blog list elements" do			
			#create blogs into the test db
			blogs= []
			6.times do |i|
				 title = "my title #{Random.rand(10000)}"
			 	 b = FactoryGirl.create(:blog, title: title)
			 	 blogs << b
			end
			#loop over the 6 blog entries
			blogs.each do |blog|
				# the 6th blog entry should not be displayed - it is the one we created first, we are displaying in descending order
				if blog == blogs[0] then
					 it { should_not have_selector('header ul.accordmobile li#blog ul li a', text: blog.title ) }
					 next
				end
				it { should have_selector('header ul.accordmobile li#blog ul li a', text: blog.title ) }
			end
		end

		describe "Invisible blogs should not show" do			
			#create blogs into the test db
			blogs= [] 
			1.times do |i|
				 title = "my title #{Random.rand(10000)}"
			 	 b = FactoryGirl.create(:blog, title: title, visible: false )
			 	 blogs << b
			end
			#loop over the blog entries
			blogs.each do |blog|
				it { should_not have_selector('header ul.accordmobile li#blog ul li a', text: blog.title ) }
			end
		end

		pending "faq" do
			it { should have_link('FAQ', href: faq_path) }

			it "click faq" do
				click_link('FAQ')
				page.should have_selector('h2', text: 'Frequently Asked Questions')
			end
		end	

		it { should have_link 'About', href: about_path }

		it "click about" do
			click_link('About')
			page.should have_selector('h2', text: 'About Me')
		end
	end

	describe "click link to contact us" do
		before { click_link "Contact" }
		it { should have_selector('h1', text: 'Contact') }
	end

end
