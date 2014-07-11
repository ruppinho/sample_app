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
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of :email, case_sensitive: false

  validates_length_of :password, minimum: 6

  #
  # Callbacks
  #
  before_save { self.email = email.downcase }

end
