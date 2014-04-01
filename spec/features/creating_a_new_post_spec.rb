require 'spec_helper'

describe "creating a new post" do
  it "redirects to the homepage showing the new post" do
    visit "/"

    fill_in "Name", with: "Great Post"
    fill_in "Body", with: "This is my great post, it's great huh!?"
    click_button "Create Post"

    expect(page).to have_content("Great Post")
    expect(page).to have_content("This is my great post")
    expect(page.current_path).to eql("/")
  end
end
