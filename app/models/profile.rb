class Profile < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :picture, presence: true,
  content_type: {content_type: ["image/jpeg", "image/svg", "image/png"]}

  validates :name,
            :position,
            :biography, presence: true
end
