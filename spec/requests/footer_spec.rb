require 'spec_helper'
	
describe "Footer"  do
	subject { page }
	before { visit root_path }
	
	pending do
		it { should have_link 'Login', href: signin_path }
		it { should have_link "Contact Us", href: contact_path }
		it { should have_link "Latest Blog Posts", href: blogs_path }
	end

	describe "Contact Us" do
		
		it { should have_selector('div.span4 section h4', text: 'Contact Us')}
		it { should have_selector('div.span4 section p', text:'Rails Fever')}
	end

	describe "Latest Blog Posts" do	

		#create blogs into the test db
		blogs= Array.new() 
		7.times do |i|
		 	 b = Blog.new(content: "my blog", title: "my title #{i + 10}" )
		 	 b.save
		 	 blogs << b
		end
		#loop over the 7 blog entries
		blogs.each do |blog|
			# the 7th blog entry should not be displayed - it is the one we created first, we are displaying in descending order
			if blog.title.include? '10' then
				 it { should_not have_selector('footer ul.footerPosts li a', text: blog.title ) }
				 next
			end
			it { should have_selector('footer ul.footerPosts li a', text: blog.title ) }
			it { should have_selector('footer ul.footerPosts li span.meta', text: blog.created_at.strftime("%B %-d, %Y") ) }
		end
  	end

  	describe "News" do
  		it { should have_link 'Beautiful Javascript charts with one line of Ruby', href: 'http://ankane.github.io/chartkick/'}
  		it { should have_link 'Ensure your periodic tasks are actually running', href: 'https://deadmanssnitch.com/'}
  		it { should have_link 'Help Rails Girls students get into open source projects', href: 'http://railsgirlssummerofcode.org/campaign/'}
  		it { should have_link 'Building Basecamp for iPhone in RubyMotion', href: 'http://37signals.com/svn/posts/3432-why-i-loved-building-basecamp-for-iphone-in-rubymotion'}
  		it { should have_link 'Heroku Launches Platform API', href: 'http://blog.programmableweb.com/2013/05/30/heroku-launches-platform-api/'}
  		it { should have_link 'White House drafts official ODP of the U.S on GitHub', href: 'http://venturebeat.com/2013/05/09/white-house-drafts-official-open-data-policy-of-the-united-states-on-github/#lUqdMOwEPFljQFrq.99'}
  		it { should have_link "IPv6 will be fully implemented on May 10, 2148", href: 'http://venturebeat.com/2013/06/07/at-our-current-rate-of-progress-ipv6-will-be-fully-implemented-on-may-10-2048/#9qUOetFzq1BJTq52.99'}
  	end
end