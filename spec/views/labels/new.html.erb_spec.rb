require 'rails_helper'

RSpec.describe "labels/new", type: :view do
  before(:each) do
    assign(:label, Label.new(
      :tag => "MyString"
    ))
  end

  it "renders new label form" do
    render

    assert_select "form[action=?][method=?]", labels_path, "post" do

      assert_select "input[name=?]", "label[tag]"
    end
  end
end
