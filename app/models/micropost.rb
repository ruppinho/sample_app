class Micropost < ActiveRecord::Base

  #
  # Relations
  #
  belongs_to :user

  #
  # Validators
  #
  validates_presence_of :user_id

  validates_presence_of :content
  validates_length_of :content, maximum: 140

  #
  # Scopes
  #
  default_scope -> { order('created_at DESC') }

end
