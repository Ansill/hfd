include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :profile do
    name Faker::Name.name
    position Faker::Company.bs
    biography Faker::Lorem.paragraph(1)
    facebook_url Faker::Internet.url
    instagram_url Faker::Internet.url
    twitter_url Faker::Internet.url
    youtube_url Faker::Internet.url
    picture { [
      fixture_file_upload(Rails.root.join('spec', 'fixtures', 'test.jpeg'), 'image/jpeg'),
      fixture_file_upload(Rails.root.join('spec', 'fixtures', 'png_test.png'), 'image/png'),
      fixture_file_upload(Rails.root.join('spec', 'fixtures', 'NewTux.svg'), 'image/svg')
    ].sample }
  end
end