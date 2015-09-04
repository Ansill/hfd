require 'rails_helper'

feature "User creates profile" do

  scenario "with correct information" do
    sign_in
    visit new_profile_path
    attach_file 'profile_picture', 'spec/fixtures/test.jpeg'
    fill_in 'profile_name', with: 'William'
    fill_in 'profile_position', with: 'Cameraman'
    fill_in 'profile_biography', with: Faker::Lorem.paragraph(1)
    fill_in 'profile_facebook_url', with: Faker::Internet.url
    fill_in 'profile_instagram_url', with: Faker::Internet.url
    fill_in 'profile_twitter_url', with: Faker::Internet.url
    fill_in 'profile_youtube_url', with: Faker::Internet.url
    click_button 'Create Profile'
    expect(current_path).to eq profiles_path
  end

  scenario 'with bad data' do
    sign_in
    visit new_profile_path
    click_button 'Create Profile'
    expect(page).to have_content("Profile not created")
  end

private

  def sign_in
    create(:user)
    visit "/"
    visit new_user_session_path
    fill_in "user_email", with:"test@test.com"
    fill_in "user_password", with:"password"
    click_button "Log in"
  end

end