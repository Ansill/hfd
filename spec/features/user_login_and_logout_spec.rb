require 'rails_helper'

feature "User logs in and logs out" do

  # `js: true` spec metadata means this will run using the `:selenium`
  # browser driver configured in spec/support/capybara.rb
  scenario "with correct details" do

    create(:user)

    visit "/"

    click_link "Login"
    expect(page).to have_css("h2", text: "Log in")
    expect(current_path).to eq(new_user_session_path)

    fill_in "Email", with:"test@test.com"
    fill_in "Password", with:"password"

    click_button "Log in"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully"

    click_link "Logout"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed out successfully"

  end

end