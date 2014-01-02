require 'spec_helper'

describe "likes/edit" do
  before(:each) do
    @like = assign(:like, stub_model(Like,
      :post_id => 1,
      :profile_id => 1
    ))
  end

  it "renders the edit like form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", like_path(@like), "post" do
      assert_select "input#like_post_id[name=?]", "like[post_id]"
      assert_select "input#like_profile_id[name=?]", "like[profile_id]"
    end
  end
end
