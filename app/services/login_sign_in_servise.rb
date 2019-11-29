# frozen_string_literal: true

class LoginSignInServise
  def initialize(email, password)
    @email = email
    @password = password
  end

  def jwt
    data = { id: @user.id }
    jwt = JWT.encode(data, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def find_user
    @user = User.find_by(email: @email)
    @user.nil? ? false : true
  end

  def valid_password
    if find_user
      @user.valid_password?(@password) ? true : false
    else
      false
    end
  end
end
