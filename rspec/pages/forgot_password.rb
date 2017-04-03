require_relative '../lib/common_page'

# This class tests forgot password
class ForgotPassword < CommonPage
  LOCATOR = YAML.load_file(File.open('../locators/forgot_pass.yml'))

  def pass_chnge_email
    button_click(LOCATOR['FRGT_PASS_BTN'])
    email_id = Constants::USERNAME_FORGOT
    type(LOCATOR['USERNAME_INPUT'], email_id)
    button_click(LOCATOR['SND_INST_BTN'])
    sleep 2
    button_click(LOCATOR['BCK_LOGIN_BTN'])
  end

  def try(number_of_times)
    count = 0
    item_of_interest = nil
    until item_of_interest != nil || count == number_of_times
      item_of_interest = yield
      sleep 10
      count += 1
    end
  end

  def retrieve_gmail
    gmail = Gmail.new(Constants::EMAIL_USERNAME, Constants::EMAIL_PASSWORD)
    try(6) do
      @email = gmail.inbox.emails(:unread, from: 'support@shopsocial.ly').last
    end
    message_body = @email.message.body.raw_source
    @new_url = message_body.scan(/https?:\/\/[\S]+/).last
    @username = message_body.scan(/username: (.*)$/)[0][0].strip
    @password = message_body.scan(/password: (.*)$/)[0][0].strip
  end

  def new_pass_url
    @driver.get @new_url
    @driver.find_element(id: 'username').send_keys @username
    @driver.find_element(id: 'password').send_keys @password
    @driver.find_element(id: 'login').submit
    expect(@driver.current_url.include?('/secure')).to eql true
  end

  def login(parameters = {})
    sleep 2
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
    button_click(LOCATOR['LOGOUT'])
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
    button_click(LOCATOR['LOGOUT'])
  end
end