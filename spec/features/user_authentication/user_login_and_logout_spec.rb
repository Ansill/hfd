require 'rails_helper'

feature "User logs in and logs out" do

  scenario "with correct details" do

    create(:user)

    visit "/"

    visit new_user_session_path
    expect(page).to have_css("h2", text: "log in")
    expect(current_path).to eq(new_user_session_path)

    fill_in "user_email", with:"test@test.com"
    fill_in "user_password", with:"password"

    click_button "Log in"

    expect(current_path).to eq "/"

    click_link "Log out"

    expect(current_path).to eq "/"
  end

  scenario 'with incorrect details' do

    create(:user)

    visit '/'

    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)

    fill_in "user_email", with: ''
    fill_in "user_password", with: ''

    click_button "Log in"
    expect(current_path).to eq '/admin/sign_in'
  end

end