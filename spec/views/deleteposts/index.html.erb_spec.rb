require 'spec_helper'

describe "deleteposts/index" do
  before(:each) do
    assign(:deleteposts, [
      stub_model(Deletepost,
        :post_id => 1,
        :user_id => 2
      ),
      stub_model(Deletepost,
        :post_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of deleteposts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
