require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        message: "Message",
        fb_id: "Fb",
        updated_time: "Updated Time",
        group: nil
      ),
      Post.create!(
        message: "Message",
        fb_id: "Fb",
        updated_time: "Updated Time",
        group: nil
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Message".to_s, count: 2
    assert_select "tr>td", text: "Fb".to_s, count: 2
    assert_select "tr>td", text: "Updated Time".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
