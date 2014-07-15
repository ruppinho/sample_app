# Class to model the followers relationship between users
class Relationship < ActiveRecord::Base
  #
  # Relations
  #
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  #
  # Validators
  #
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
