class Article < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope order("created_at DESC")

  validates :title, presence: true, uniqueness: true

  def to_param
  	"#{id}-#{title}".parameterize
  end
end
