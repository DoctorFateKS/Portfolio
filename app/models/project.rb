class Project < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true
  validates :live_link, format: { with: URI::regexp(%w[http https]), allow_blank: true }
  validates :source_code_link, format: { with: URI::regexp(%w[http https]), allow_blank: true }
end
