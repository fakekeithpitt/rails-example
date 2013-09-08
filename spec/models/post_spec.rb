require 'spec_helper'

describe Post do
  it "saves to the database" do
    Post.create(:name => "Buildbox is great", :body => "Trust me!")

    latest_post = Post.last
    latest_post.name.should == "Buildbox is great"
    latest_post.body.should == "Trust me!"
  end
end
