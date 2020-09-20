require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      name: "MyString",
      fb_id: "MyString",
      description: "MyText",
      privacy: "MyString"
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input[name=?]", "group[name]"

      assert_select "input[name=?]", "group[fb_id]"

      assert_select "textarea[name=?]", "group[description]"

      assert_select "input[name=?]", "group[privacy]"
    end
  end
end
