require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      message: "MyString",
      fb_id: "MyString",
      updated_time: "MyString",
      group: nil
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[message]"

      assert_select "input[name=?]", "post[fb_id]"

      assert_select "input[name=?]", "post[updated_time]"

      assert_select "input[name=?]", "post[group_id]"
    end
  end
end
