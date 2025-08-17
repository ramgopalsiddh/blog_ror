class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGIX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGIX }
  has_secure_password
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  def generate_password_reset_token!
    self.reset_password_token = SecureRandom.urlsafe_base64
    self.reset_password_sent_at = Time.zone.now
    save!
  end

  def password_reset_token_expired?
    reset_password_sent_at < 2.hours.ago
  end

  def clear_password_reset_token!
    self.reset_password_token = nil
    self.reset_password_sent_at = nil
    save!
  end
end

