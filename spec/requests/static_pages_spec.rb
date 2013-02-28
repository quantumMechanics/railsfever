require 'spec_helper'

describe "StaticPages" do

	subject { page }

	describe "Home page" do
		before { visit root_path }
		it { should have_selector("h1", class: 'first') }
		it { should have_selector("h1", class: 'second') }
		it { should have_selector("div", class: 'landing')}
		it { should have_selector("h2", id: 'contact-us') }

		describe "link to contact" do
			before { click_link "Contact Us Now"}
			it_should_behave_like "contact us page"
		end
	end

	describe "Contact us" do 
		before { visit contact_path }
		it_should_behave_like "contact us page"
	end

	shared_examples_for "contact us page" do 
		it { should have_selector('form')}
	end

end
