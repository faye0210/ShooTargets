require 'rails_helper'

RSpec.describe "labels/index", type: :view do
  before(:each) do
    assign(:labels, [
      Label.create!(
        :tag => "Tag"
      ),
      Label.create!(
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of labels" do
    render
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
