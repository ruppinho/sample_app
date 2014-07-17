# User model class
class User < ActiveRecord::Base
  #
  # Fields
  #
  has_secure_password

  #
  # Relations
  #
  has_many :microposts,
           dependent: :destroy

  has_many :relationships,
           foreign_key: 'follower_id',
           dependent:   :destroy

  has_many :followed_users,
           through: :relationships,
           source:  :followed

  has_many :reverse_relationships,
           foreign_key: 'followed_id',
           class_name:  'Relationship',
           dependent:   :destroy

  has_many :followers,
           through: :reverse_relationships,
           source:  :follower

  #
  # Validators
  #
  validates :name,
            presence: true,
            length:   { maximum: 50 }

  validates :email,
            presence:   true,
            uniqueness: { case_sensitive: false },
            format:     { with: /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i }

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
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
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
