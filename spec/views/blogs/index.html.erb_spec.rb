require 'spec_helper'

describe "blogs/index" do
  before(:each) do
    assign(:blogs, [
      stub_model(Blog,
        :content => "Content"
      ),
      stub_model(Blog,
        :content => "Content"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
