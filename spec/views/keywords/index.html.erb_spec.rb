require 'rails_helper'

RSpec.describe "keywords/index", type: :view do
  before(:each) do
    assign(:keywords, [
      Keyword.create!(
        keyword: "MyText",
        group: nil
      ),
      Keyword.create!(
        keyword: "MyText",
        group: nil
      )
    ])
  end

  it "renders a list of keywords" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
