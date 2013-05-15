require 'spec_helper'

describe "videos/show" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :title => "Title",
      :url => "Url",
      :length => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
