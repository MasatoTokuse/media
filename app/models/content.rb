class Content < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 400 }
  TEXT_BG_COLOR = ["text-white bg-primary", "text-white bg-secondary", "text-white bg-success", "text-white bg-danger", "text-white bg-warning", "text-white bg-info", "bg-light", "text-white bg-dark"]
end
