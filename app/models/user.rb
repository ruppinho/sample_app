class User < ActiveRecord::Base

  #
  # Fields
  #
  has_secure_password

  #
  # Validators
  #
  validates_presence_of :name
  validates_length_of :name, maximum: 50

  validates_presence_of :email
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_uniqueness_of :email, case_sensitive: false

  validates_length_of :password, minimum: 6

  #
  # Callbacks
  #
  before_save { self.email.downcase! }
  before_create :create_remember_token

  #
  # Methods
  #

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

end
