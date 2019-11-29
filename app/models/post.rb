class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, body: true

  scope :active_posts, -> { where(active: true) }
  scope :inactive_posts, -> { where(active: false) }

  after_validation :default_active

  private

  def default_active
    self.active = true if active.nil?
  end
end
