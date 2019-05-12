class User < ApplicationRecord
  has_many :contents, dependent: :destroy
  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  VALID_PASSWORD_REGEX = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{1,}"
  INVALID_PASSWORD_MESSAGE = "数字、小文字アルファベット、大文字アルファベットをそれぞれ1文字以上含んでください"
  validates :password, presence: true, length: { minimum: 6 }
end

# 渡された文字列のハッシュ値を返す
def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

private

# メールアドレスをすべて小文字にする
def downcase_email
  email.downcase!
end
