require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      message: "Message",
      fb_id: "Fb",
      updated_time: "Updated Time",
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Message/)
    expect(rendered).to match(/Fb/)
    expect(rendered).to match(/Updated Time/)
    expect(rendered).to match(//)
  end
end
