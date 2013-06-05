require 'spec_helper'
	
describe "Footer"  do
	subject { page }
	before { visit root_path }
	
	it { should have_link 'Login', href: signin_path }
end