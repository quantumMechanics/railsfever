require 'spec_helper'

describe Blog do
  
  before do
  	@blog = Blog.new(content: "my blog", title: "nice post", visible: true)
  end

  subject { @blog }

  	it { should respond_to :content }
  	it { should respond_to :title }
  	it { should respond_to :previous_post }
  	it { should respond_to :next_post }
  	it { should respond_to :slug }
  	it { should respond_to :visible? }
  	it { should respond_to :views }
  	it { should respond_to :likes }
  	it { should be_valid }

  
  	describe "with blank content" do
  		before { @blog.content = " " }
  		it { should_not be_valid }
  	end

  	describe "with blank title" do
  		before { @blog.title = " " }
  		it { should_not be_valid }
  	end

	describe "comment associations" do
		before { @blog.save }
		  
		let!(:older_comment) do
		  FactoryGirl.create(:comment, blog: @blog, created_at: 1.day.ago)
		end

		let!(:newer_comment) do
		  FactoryGirl.create(:comment, blog: @blog, created_at: 1.hour.ago)
		end


		it "should have the right comments in the right order" do
		  @blog.comments.should == [newer_comment, older_comment]
		end

		it "should delete associated comments" do
		  comments = @blog.comments.dup
		  @blog.destroy
		  comments.should_not be_empty #this is validating that we are duplicating the array during creation and not copying the reference
		  comments.each do |comment|
		  	Comment.find_by_id(comment.id).should be_nil
		  end
		end


		# let!(:older_blog) do
		# 	FactoryGirl.create(:blog, created_at: 1.day.ago)
		# end

		# let!(:newer_blog) do 
		# 	FactoryGirl.create(:blog, created_at: 1.hour.ago)
		# end

		# it "should have the right blogs in the right order" do
		# 	Blog.all.should == [newer_blog, older_blog]
		# end

	end

	describe "slug should not be blank" do
		before { @blog.valid? } #do something to trigger a db search on the blog, which will cause the slug to be generated
		it { @blog.slug.should_not be_nil }
	end

end
