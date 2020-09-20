require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        name: "Name",
        fb_id: "Fb",
        description: "MyText",
        privacy: "Privacy"
      ),
      Group.create!(
        name: "Name",
        fb_id: "Fb",
        description: "MyText",
        privacy: "Privacy"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Fb".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Privacy".to_s, count: 2
  end
end
