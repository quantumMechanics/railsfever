
shared_examples_for "contact us page" do 
		it { should have_selector('form')}
		it { should have_selector('form input', type: 'text', id: 'first-name') }
		it { should have_selector('form input', type: 'text', id: 'last-name') }
		it { should have_selector('form input', type: 'email', id: 'email') }
		it { should have_selector('form input', type: 'tel', id: 'tel') }
		it { should have_selector('form input', type: 'text', id: 'subject') }
		it { should have_selector('form textarea', id: 'message') }
end

shared_examples_for "Home page" do
		it { should have_selector("h1", class: 'first') }
		it { should have_selector("h1", class: 'second') }
		it { should have_selector("div", class: 'landing') }
		it { should have_selector("h2", id: 'contact-us') }
end