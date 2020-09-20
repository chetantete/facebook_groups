require 'rails_helper'

RSpec.describe "keywords/new", type: :view do
  before(:each) do
    assign(:keyword, Keyword.new(
      keyword: "MyText",
      group: nil
    ))
  end

  it "renders new keyword form" do
    render

    assert_select "form[action=?][method=?]", keywords_path, "post" do

      assert_select "textarea[name=?]", "keyword[keyword]"

      assert_select "input[name=?]", "keyword[group_id]"
    end
  end
end
