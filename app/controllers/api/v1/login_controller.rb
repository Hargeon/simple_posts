# frozen_string_literal: true

module Api
  module V1
    class LoginController < BaseController
      def create
        api_object = LoginServise.new(params[:email], params[:password])
        if api_object.valid_password?
          success_responce(api_object.jwt)
        else
          unsuccess_responce
        end
      end

      private

      def unsuccess_responce
        render json: { "message": 'Error' }, status: 400
      end

      def success_responce(jwt)
        render json: { token: jwt }
      end
    end
  end
end
