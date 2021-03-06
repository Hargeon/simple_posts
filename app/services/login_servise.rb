# frozen_string_literal: true

class LoginServise
  def initialize(email, password)
    @email = email
    @password = password
  end

  def jwt
    data = { id: @user.id }
    JWT.encode(data, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def find_user
    @user = User.find_by(email: @email)
    !@user.nil?
  end

  def valid_password?
    find_user ? @user.valid_password?(@password) : false
  end
end
