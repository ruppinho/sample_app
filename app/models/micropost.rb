# Class for micropost model
class Micropost < ActiveRecord::Base
  #
  # Relations
  #
  belongs_to :user

  #
  # Validators
  #
  validates :user_id,
            presence: true

  validates :content,
            presence: true,
            length:   { maximum: 140 }

  #
  # Scopes
  #
  default_scope { order('created_at DESC') }

  #
  # Methods
  #
  class << self
    def from_users_followed_by(user)
      followed_user_ids = 'SELECT followed_id FROM relationships WHERE follower_id = :user_id'
      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
            user_id: user.id)
    end
  end
end
