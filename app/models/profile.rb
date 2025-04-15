class Profile < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true, uniqueness: true
  validates :bio, presence: true

  has_one_attached :avatar
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :avatar, size: { less_than: 5.megabytes , message: 'is too large' }
end
