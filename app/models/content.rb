class Content < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :text, presence: true, length: {maximum: 400}
end
