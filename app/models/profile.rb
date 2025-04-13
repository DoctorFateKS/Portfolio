class Profile < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true, uniqueness: true
  validates :bio, presence: true
end
