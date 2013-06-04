
shared_examples_for "contact us page" do 
		
end

shared_examples_for "Home page" do
		it { should have_selector("h1", class: 'first') }
		it { should have_selector("h1", class: 'second') }
		it { should have_selector("div", class: 'landing') }
		it { should have_selector("h2", id: 'contact-us') }
end