# ================================================================
# Purpose:	Test the login page
# ================================================================
require_relative '../lib/common_page'
require_relative '../pages/login'

# All methods related to login
class Login < CommonPage
  LOCATOR = YAML.load_file(File.open('../locators/login.yml'))

  def check_page
    p is_displayed?(LOCATOR[:USERNAME_INPUT])
  end

  def authentication(parameters = {})
    username	= parameters[:username] || Constants::USERNAME_DEFAULT
    password	= parameters[:password] || Constants::PASSWORD_DEFAULT

    typenew(LOCATOR['USERNAME_INPUT'], username)
    typenew(LOCATOR['PASSWORD_INPUT'], password)
    button_click(LOCATOR['LOGIN_BUTTON'])
  end

  def check_landing_page
    p is_displayed?(LOCATOR['HOME_SCREEN'])
  end

  def incorrect_username(parameters = {})
    w_username = 'nachiket+zinre@shopsocially.com'
    password	= parameters[:password] || Constants::PASSWORD_DEFAULT
    type(LOCATOR['USERNAME_INPUT'], w_username)

    type(LOCATOR['PASSWORD_INPUT'], password)
    button_click(LOCATOR['LOGIN_BUTTON'])
    sleep 2
    err_msg = 'Email address or password was incorrect. Please try again.'
    p text_displayed?(LOCATOR['FAILURE_MSG'], err_msg)
    button_click(LOCATOR['CLOSE_ALERT'])
  end

  def incorrect_password(parameters = {})
    w_password = '12345test'
    username	= parameters[:username] || Constants::USERNAME_DEFAULT
    typenew(LOCATOR['USERNAME_INPUT'], username)
    typenew(LOCATOR['PASSWORD_INPUT'], w_password)
    button_click(LOCATOR['LOGIN_BUTTON'])
    sleep 2
    err_msg = 'Email address or password was incorrect. Please try again.'
    p text_displayed?(LOCATOR['FAILURE_MSG'], err_msg)
    button_click(LOCATOR['CLOSE_ALERT'])
  end
end