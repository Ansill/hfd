require 'rails_helper'

RSpec.describe Profile, :type => :model do

  it {is_expected.to validate_presence_of (:name) }

  it {is_expected.to validate_presence_of (:position) }

  it {is_expected.to validate_presence_of (:biography) }

  it {is_expected.to validate_attachment_presence (:picture) }

  it {is_expected.to have_attached_file (:picture) }

  it { should validate_attachment_content_type(:picture).
              allowing('image/png', 'image/jpg', 'image/svg').
              rejecting('image/pdf', 'image/gif', 'text/plain') }

end
