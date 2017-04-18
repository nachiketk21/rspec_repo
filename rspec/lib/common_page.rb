require 'uri'
require 'yaml'
require_relative '../lib/base_page'
require_relative '../config/constants'

# This class contains all basic methods used in all classes
class CommonPage < BasePage
  LOCATOR = YAML.load_file(File.open('locators/login.yml'))
  def initialize(driver)
    super
  end

  def visit(url_path)
    if url_path =~ URI::regexp
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

  def authentication(parameters = {})
    username	= parameters[:username] || Constants::USERNAME_DEFAULT
    password	= parameters[:password] || Constants::PASSWORD_DEFAULT

    typenew(LOCATOR['USERNAME_INPUT'], username)
    typenew(LOCATOR['PASSWORD_INPUT'], password)
    button_click(LOCATOR['LOGIN_BUTTON'])
  end
end