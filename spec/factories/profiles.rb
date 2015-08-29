include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :profile do
    name "MyString"
    position "MyString"
    biography "MyText"
    facebook_url "MyString"
    instagram_url "MyString"
    twitter_url "MyString"
    youtube_url "MyString"
    picture { [
      fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test.jpeg'), 'image/jpeg'),
      fixture_file_upload(Rails.root.join('spec', 'fixtures', 'png_test.png'), 'image/png'),
      fixture_file_upload(Rails.root.join('spec', 'fixtures', 'NewTux.svg'), 'image/svg')
    ].sample }
  end
end