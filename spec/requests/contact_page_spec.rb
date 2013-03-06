require 'spec_helper'
require 'requests/shared'

describe "ContactPage" do 

	subject { page }

	before { visit contact_path }

	describe "Contact us" do 
		it_should_behave_like "contact us page"
	end

	describe "After clicking logo" do
		before { click_link 'logo-not-homepage' }
		it_should_behave_like "Home page"
	end
	
end