require 'spec_helper'

describe "deleteposts/new" do
  before(:each) do
    assign(:deletepost, stub_model(Deletepost,
      :post_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new deletepost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deleteposts_path, "post" do
      assert_select "input#deletepost_post_id[name=?]", "deletepost[post_id]"
      assert_select "input#deletepost_user_id[name=?]", "deletepost[user_id]"
    end
  end
end
