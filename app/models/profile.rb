class Profile < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  process_in_background :picture
  validates :name,
            :position,
            :biography, presence: true

end
