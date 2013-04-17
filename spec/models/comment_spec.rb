require 'spec_helper'

describe Comment do
  
  let(:blog)  { FactoryGirl.create(:blog) }
  before do
  	@comment = blog.comments.build(content: "I like this post")
  end

  subject { @comment }

  it { should respond_to(:content)  }
  it { should respond_to(:blog_id) }
  it { should respond_to(:blog) }
  its(:blog) { should == blog }

  it { should be_valid }

  describe "when blog_id is not present" do
  	before { @comment.blog_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank comment" do
  	before { @comment.content = " "}
  	it { should_not be_valid }
  end

  describe "accessible attributes" do
  	it "should not allow access to blog_id" do
  		expect do
  			Comment.new(blog_id: blog.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

end
