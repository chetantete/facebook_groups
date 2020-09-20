require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      message: "MyString",
      fb_id: "MyString",
      updated_time: "MyString",
      group: nil
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[message]"

      assert_select "input[name=?]", "post[fb_id]"

      assert_select "input[name=?]", "post[updated_time]"

      assert_select "input[name=?]", "post[group_id]"
    end
  end
end
