require 'spec_helper'

shared_examples_for "blog entry header" do
		it { should have_selector('article.entry-post') }
		it { should have_selector('article > header.entry-header') }
		
		it { should have_selector('article > header > div') }
		it { should have_selector('article div.entry-content p') }
end

describe "Blog" do
	let(:blog_previous) {FactoryGirl.create(:blog)}
	let(:blog) {FactoryGirl.create(:blog)}
	let(:blog_next) {FactoryGirl.create(:blog)}
	
	subject { page }
	
	before do 
		visit blogs_path
	end

	

	describe "index entry" do
		it_should_behave_like "blog entry header"
		it { should have_selector('article > header > h3') }
		it { should have_selector('article div.entry-content p a.btn.btn-primary', text: 'Read More' ) }
		it { should have_selector('article footer span.blog.date') }
		it { should have_selector('div.pagination.pagination-right.no-margin.pagination-mini ul li a') }
	end

	describe "show" do
		before { visit blog_path(blog.id) }
		it_should_behave_like "blog entry header"
		it { should have_selector('article > header > h1') }
	end

	describe "previous next navigation" do
		before { visit blog_path(blog.id) }
		it { should have_selector('div.entry-pagination ul.pager li') }
		it { should have_link("< Older", href: blog_path(blog_previous.id) )}
		it { should have_link('Newer', href: blog_path(blog_next.id) )}
	end
end
