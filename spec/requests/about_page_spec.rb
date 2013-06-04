require 'spec_helper'
	
describe "About" do

	subject { page }

	before { visit about_path }

	it { should have_selector('div img', src: 'wale.png', alt: 'Wale Olaleye')}
	
	it { should have_css("div p:contains('polyglot')") }
	it { should have_css("div p:contains('agile development')") }
	it { should have_css("div p:contains('static and dynamic')") }
	it { should have_css("div p:contains('system administration')") }
	it { should have_css("div p:contains('amiable')") }

	it { should have_selector('div div ul li img', src: 'rails_logo.png') }
	it { should have_selector('div div ul li img', src: 'html5_logo.png') }
	it { should have_selector('div div ul li img', src: 'css3_logo.png') }
	it { should have_selector('div div ul li img', src: 'ruby_logo.png') }
	it { should have_selector('div div ul li img', src: 'github_logo.png') }
	it { should have_selector('div div ul li img', src: 'jquery_logo.png') }
	it { should have_selector('div div ul li img', src: 'heroku_logo.png') }	

	describe 'click rails logo' do
		before { click_link('ror-logo') }
		it { current_url.should == "http://www.rubyonrails.org/" }
	end
	describe 'click html5 logo', js: true do
		before { click_link("html5-logo") }
		it { current_url.should == "http://en.wikipedia.org/wiki/HTML5" }
	end
	describe 'click css3 logo', js:true do
		before { click_link('css3-logo') }
		it { current_url.should == "http://en.wikipedia.org/wiki/Css" }
	end
	describe 'click ruby logo' do
		before { click_link('ruby-logo') }
		it { current_url.should == "http://www.ruby-lang.org/" }
	end
	describe 'click github logo' do
		before { click_link('github-logo') }
		it { current_url.should == "http://www.github.com/" }
	end
	describe 'click jquery logo' do
		before { click_link('jquery-logo') }
		it { current_url.should == "http://www.jquery.com/" }
	end
	describe 'click heroku logo' do
		before { click_link('heroku-logo') }
		it { current_url.should == "http://www.heroku.com/" }
	end

end
	
