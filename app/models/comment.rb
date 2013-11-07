class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id

  belongs_to :article
  belongs_to :user

  default_scope order("created_at ASC")

  validates :message, presence: true
end
