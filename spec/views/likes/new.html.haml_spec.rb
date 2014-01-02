require 'spec_helper'

describe "likes/new" do
  before(:each) do
    assign(:like, stub_model(Like,
      :post_id => 1,
      :profile_id => 1
    ).as_new_record)
  end

  it "renders new like form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", likes_path, "post" do
      assert_select "input#like_post_id[name=?]", "like[post_id]"
      assert_select "input#like_profile_id[name=?]", "like[profile_id]"
    end
  end
end
