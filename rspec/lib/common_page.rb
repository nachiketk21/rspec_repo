require 'uri'
require 'yaml'
require_relative '../lib/base_page'

# This class contains all basic methods used in all classes
class CommonPage < BasePage
  def initialize(driver)
    super
  end

  def visit(url_path)
    if url_path =~ URI
      # Correct URL (ex: http://www.google.com)
      super
    else
      # Partial URL (ex: /login)
      super(Constants::BASE_URL + url_path)
    end
    end

  def logout
    visit(Paths::LOGOUT)
  end
end