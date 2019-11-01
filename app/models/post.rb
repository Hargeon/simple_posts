class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  scope :active_posts, -> { where(active: true) }
  scope :inactive_posts, -> { where(active: false) }

  after_validation :default_active

  private

  def default_active
    if active.nil?
      self.active = true
    end
  end
end
