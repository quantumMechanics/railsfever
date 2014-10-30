require 'spec_helper'

describe 'Page Titles' do
	subject { page }
	let(:base_title) { "Rails Fever" }

	context "Home" do
		before { visit root_path }
		it { should have_selector 'title', text: "#{base_title} | Philadelphia Freelance Ruby on Rails Developer Consultant" }
  	end

  	context "About" do
  		before { visit about_path }
  		it { should have_selector 'title', text: "#{base_title} | Wale Olaleye Experienced Ruby Developer Consultant" }
  	end

  	context "Contact" do
  		before { visit contact_path }
  		it { should have_selector 'title', text: "#{base_title} | Send a message" }
  	end

  	context "Blog Index" do
  		before { visit blogs_path }
  		it { should have_selector 'title', text: "#{base_title} | Blog" }
  	end

  	context "Blog View" do
  		before do
  			@blog = create :blog
  			visit blog_path(@blog)
  		end
  		it { should have_selector 'title', text: "#{base_title} | #{@blog.title}" }
	end

end
