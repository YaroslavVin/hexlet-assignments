# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    accept_language = request.env['HTTP_ACCEPT_LANGUAGE'].to_s

    locale =
      if accept_language.include?('en,ru')
        :en
      else
        :ru
      end

    I18n.locale = locale

    @app.call(env)
  end
end