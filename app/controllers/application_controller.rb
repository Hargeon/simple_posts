class ApplicationController < ActionController::Base
  before_action :set_locale
  include Pagy::Backend

  private

  def set_locale
    if user_signed_in? && !current_user.locale.nil?
      I18n.locale = current_user.locale
    else
      default_locale
    end
  end

  def default_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
