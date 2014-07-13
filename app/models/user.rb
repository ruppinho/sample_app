# User model class
class User < ActiveRecord::Base
  #
  # Fields
  #
  has_secure_password

  #
  # Relations
  #
  has_many :microposts, dependent: :destroy

  #
  # Validators
  #
  validates :name,
            presence: true,
            length: { maximum: 50 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validates :password,
            presence: true,
            length:   { minimum: 6 }

  #
  # Callbacks
  #
  before_save { email.downcase! }
  before_create :create_remember_token

  #
  # Methods
  #
  def feed
    # This is preliminary. See 'Following users' for the full implementation.
    Micropost.where('user_id = ?', id)
  end

  class << self
    def new_remember_token
      SecureRandom.urlsafe_base64
    end

    def digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
