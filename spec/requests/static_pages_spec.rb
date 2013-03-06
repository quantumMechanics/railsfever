require 'spec_helper'
require 'requests/shared'

describe "StaticPages" do

	subject { page }

	before { visit root_path }
	
	describe "Home" do
		it_should_behave_like "Home page"
	end

	describe "click link to contact us" do
		before { click_link "Contact Us Now" }
		it_should_behave_like "contact us page"
	end

end
