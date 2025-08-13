class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :basic_authenticate

  private

  def basic_authenticate
    return unless Rails.env.staging? || Rails.env.development?

    authenticate_or_request_with_http_basic("Restricted Area") do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
