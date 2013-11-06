class Article < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user

  default_scope order("created_at DESC")

  validates :title, presence: true, uniqueness: true
end
