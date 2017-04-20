require_relative '../lib/common_page'
require 'gmail'

# This class tests forgot password
class ForgotPassword < CommonPage

  LOCATOR = YAML.load_file(File.open('locators/forgot_pass.yml'))

  def pass_chnge_email
    button_click(LOCATOR['FRGT_PASS_BTN'])
    type(LOCATOR['USERNAME_INPUT'], Constants::EMAIL_USERNAME)
    button_click(LOCATOR['SND_INST_BTN'])
    sleep 2
  end

  def try(number_of_times)
    count = 0
    item_of_interest = nil
    until item_of_interest != nil || count == number_of_times
      item_of_interest = yield
      sleep 5
      count += 1
    end
  end

  def retrieve_gmail
    gmail = Gmail.new(Constants::EMAIL_USERNAME, Constants::EMAIL_PASSWORD)
    try(6) do
      @email = gmail.inbox.emails(:unread, from: 'support@shopsocial.ly').last
    end
    message_body = @email.message.body.raw_source
    new_url = message_body.scan(/https?:\/\/[\S]+/).last
    get_reset_url(new_url)
    visit($h_url[0])
  end

  def new_pass_url
    typenew(LOCATOR['PASSWORD_INPUT'],Constants::EMAIL_PASSWORD)
    typenew(LOCATOR['MAIL_CNRM_PASS'],Constants::EMAIL_PASSWORD)
    button_click(LOCATOR['CHNGE_BTN'])
    sleep 2
    p is_displayed?(LOCATOR['ERR_MSG'])
  end

  def login(parameters = {})
    sleep 8
    username	= parameters[:username] || Constants::USERNAME_FORGOT_PROFILE
    password	= parameters[:password] || Constants::EMAIL_PASSWRD

    typenew(LOCATOR['USERNAME_INPUT'], username)
    typenew(LOCATOR['PASSWORD_INPUT'], password)
    button_click(LOCATOR['LOGIN_BUTTON'])
  end

  def change_pass_profile_pg(parameters = {})
    sleep 3
    button_click(LOCATOR['PROFILE'])
    is_displayed?(LOCATOR['PRFL_HEADR'])
    old_pass = parameters[:old_pass] || Constants::EMAIL_PASSWRD
    new_pass = parameters[:new_pass] || Constants::NEW_PASS
    type(LOCATOR['OLD_PASS'], old_pass)
    type(LOCATOR['NEW_PASS'], new_pass)
    type(LOCATOR['CNFRM_PASS'], new_pass)
    sleep 2
    button_click(LOCATOR['SAVE_BTN'])
    check_success_msg
  end

  def login_again(parameters = {})
    sleep 3
    username	= parameters[:username] || Constants::USERNAME_FORGOT_PROFILE
    password	= parameters[:password] || Constants::NEW_PASS

    typenew(LOCATOR['USERNAME_INPUT'], username)
    typenew(LOCATOR['PASSWORD_INPUT'], password)
    button_click(LOCATOR['LOGIN_BUTTON'])
  end

  def change_pass_profile_again(parameters = {})
    sleep 3
    button_click(LOCATOR['PROFILE'])
    is_displayed?(LOCATOR['PRFL_HEADR'])
    old_pass = parameters[:old_pass] || Constants::EMAIL_PASSWRD
    # old_pass = Constants::EMAIL_PASSWRD
    new_pass = parameters[:new_pass] || Constants::NEW_PASS
    type(LOCATOR['OLD_PASS'], new_pass)
    type(LOCATOR['NEW_PASS'], old_pass)
    type(LOCATOR['CNFRM_PASS'], old_pass)
    button_click(LOCATOR['SAVE_BTN'])
    check_success_msg
  end

  def check_success_msg
    sleep 3
    p text_displayed?(LOCATOR['ERR_MSG'], 'x\nPassword changed for user nachiket+fpt@shopsocially.com')
    button_click(LOCATOR['LOGOUT'])
  end

  def get_reset_url(r_url)
    urls = r_url.split('http')
    urls.shift
    my_url = urls.map { |url| "http#{url}".strip.split(/[\s\,\;]/)[0] }
    $h_url = my_url[1].split '</a>'
  end
end
# Code to split and scan URL!!
# urls = raw_input.split('http')
# urls.shift
# urls.map { |url| "http#{url}".strip.split(/[\s\,\;]/)[0] }