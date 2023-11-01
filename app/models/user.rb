class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  validates :bio, length: { minimum: 50, maximum: 200 }, on: :update
  validates :email, presence: true, uniqueness: true
  VALID_PASSWORD_REGEX = /[a-z]\d/i
  validates :password, length: { minimum: 8 }, allow_nil: true,
            format: { with: VALID_PASSWORD_REGEX, message: "は英数字を含めてください。" }

  has_one_attached :avatar
  has_many :items, dependent: :destroy

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def learning_data(month)
    learning_data = self.items.where(created_at: month.beginning_of_month..month.end_of_month)
    return learning_data
  end
end
