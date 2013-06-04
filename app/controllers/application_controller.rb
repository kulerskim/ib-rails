class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_gettext_locale
  before_filter :set_locale

  def set_locale

    if params[:locale]
      session[:locale] = params[:locale]

    end
    I18n.locale = session[:locale] || I18n.default_locale

    def I18n.rtl?
      I18n.locale.to_s.in? ['he','ar']
    end

  end

end
