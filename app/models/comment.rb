class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id

  belongs_to :article
  belongs_to :user
end