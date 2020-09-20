require 'rails_helper'

RSpec.describe "keywords/show", type: :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!(
      keyword: "MyText",
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
