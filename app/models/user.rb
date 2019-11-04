class User < ApplicationRecord
  has_many :posts
  has_many :likes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_create

  private

  def welcome_create
    UserMailer.with(user: self).registration_letter.deliver_now
  end
end
