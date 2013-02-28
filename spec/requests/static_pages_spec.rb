require 'spec_helper'

describe "StaticPages" do

	subject { page }

	shared_examples_for "contact us page" do 
		it { should have_selector('form')}
		it { should have_selector('form input', type: 'text', id: 'first-name') }
		it { should have_selector('form input', type: 'text', id: 'last-name') }
		it { should have_selector('form input', type: 'email', id: 'email') }
		it { should have_selector('form input', type: 'tel', id: 'tel') }
		it { should have_selector('form input', type: 'text', id: 'subject') }
		it { should have_selector('form textarea', id: 'message') }
	end

	describe "Home page" do
		before { visit root_path }
		it { should have_selector("h1", class: 'first') }
		it { should have_selector("h1", class: 'second') }
		it { should have_selector("div", class: 'landing') }
		it { should have_selector("h2", id: 'contact-us') }

		describe "link to contact" do
			before { click_link "Contact Us Now" }
			it_should_behave_like "contact us page"
		end
	end

	describe "Contact us" do 
		before { visit contact_path }
		it_should_behave_like "contact us page"
	end


end
