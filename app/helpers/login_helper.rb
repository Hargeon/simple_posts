# frozen_string_literal: true

module LoginHelper
  class ApiObject
    attr_accessor :user, :password, :email

    def initialize(email, password)
      @email = email
      @password = password
    end

    def jwt
      data = { id: @user.id }
      jwt = JWT.encode data, Rails.application.secrets.secret_key_base, 'HS256'
      jwt
    end

    def find_user
      @user = User.find_by(email: @email)
      unless @user.nil?
        return true if valid_password
      end
      false
    end

    def valid_password
      if @user.valid_password?(@password)
        true
      else
        false
      end
    end
  end
end
