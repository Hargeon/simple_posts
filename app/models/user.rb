class User < ApplicationRecord
  DEFAULT_LOCALE = 'ru'
  has_one_attached :avatar
  has_many :pets
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :email, email: true, on: :create
  validates :name, name: true
  validates :age, numericality: { greater_than_or_equal_to: 0,
                                less_than_or_equal_to: 150 }
  validates :gender, inclusion: { in: %w(male female),
                                message: 'Only male/female' }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_create
  before_create :set_default_locale

  private

  def welcome_create
    #UserMailer.with(user: self).registration_letter.deliver_now
  end

  def set_default_locale
    self.locale ||= DEFAULT_LOCALE
  end
end
