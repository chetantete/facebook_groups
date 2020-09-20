require 'rails_helper'

RSpec.describe "keywords/edit", type: :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!(
      keyword: "MyText",
      group: nil
    ))
  end

  it "renders the edit keyword form" do
    render

    assert_select "form[action=?][method=?]", keyword_path(@keyword), "post" do

      assert_select "textarea[name=?]", "keyword[keyword]"

      assert_select "input[name=?]", "keyword[group_id]"
    end
  end
end
