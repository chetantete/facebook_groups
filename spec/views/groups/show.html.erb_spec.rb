require 'rails_helper'

RSpec.describe "groups/show", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      name: "Name",
      fb_id: "Fb",
      description: "MyText",
      privacy: "Privacy"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Fb/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Privacy/)
  end
end
