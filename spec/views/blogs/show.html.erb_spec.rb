require 'spec_helper'

describe "blogs/show" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
