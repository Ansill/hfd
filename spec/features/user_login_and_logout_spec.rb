require 'rails_helper'

feature "User logs in and logs out" do

  scenario "with correct details" do

    create(:user)

    visit "/"

    visit new_user_session_path
    expect(page).to have_css("h2", text: "Log in")
    expect(current_path).to eq(new_user_session_path)

    fill_in "Email", with:"test@test.com"
    fill_in "Password", with:"password"

    click_button "Log in"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully"

    click_link "Log out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed out successfully"

  end

end