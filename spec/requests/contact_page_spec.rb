require 'spec_helper'

describe "ContactPage" do 

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

	describe "Contact us" do 
		before { visit contact_path }
		it_should_behave_like "contact us page"
	end

	
end