require 'spec_helper'

feature "create link" do
  scenario "creating a valid link" do
    visit root_path
    click_link "Submit New Link"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "Google"
    fill_in "User", with: 1
    click_button "Create Link"
    page.should have_content "Google"
  end
end

feature "delete link" do
  scenario "deleting a valid link" do
    visit root_path
    click_link "Submit New Link"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "Google"
    fill_in "User", with: 1
    click_button "Create Link"
    click_link "X"
    expect(page).not_to have_content "Google"
  end
end

feature "follow created link" do
  scenario "following a created link" do
    visit root_path
    click_link "Submit New Link"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "Google"
    fill_in "User", with: 1
    click_button "Create Link"
    click_link "Google"
    page.should have_content "Google"
  end
end

feature "create a comment" do
  scenario "creating a comment for a link" do
    visit root_path
    click_link "Submit New Link"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "Google"
    fill_in "User", with: 1
    click_button "Create Link"
    click_link "Google"
    fill_in "User", with: 2
    fill_in "Text", with: "I have always been neutral about Google."
    click_button "Create Comment"
    page.should have_content "I have always been neutral about Google."
  end
end

feature "return to homepage" do
  scenario "returning to homepage from a link page" do
    visit root_path
    click_link "Submit New Link"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "Google"
    fill_in "User", with: 1
    click_button "Create Link"
    click_link "Google"
    click_link "Return to homepage"
    page.should have_content "All Links"
  end
end

feature "voting" do
  scenario "voting increases a link's score" do
    visit root_path
    click_link "Submit New Link"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "Google"
    fill_in "User", with: 1
    click_button "Create Link"
    click_button "↑"
    page.should have_content "Score: 1"
  end
  scenario "downvoting decreases a link's score" do
    visit root_path
    click_link "Submit New Link"
    fill_in "Url", with: "http://www.google.com"
    fill_in "Description", with: "Google"
    fill_in "User", with: 1
    click_button "Create Link"
    click_button "↑"
    click_button "↑"
    click_button "↑"
    click_button "↓"
    page.should have_content "Score: 2"
  end
end
