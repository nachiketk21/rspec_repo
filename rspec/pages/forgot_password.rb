require_relative '../lib/common_page'

# This class tests forgot password
class ForgotPassword < CommonPage
  LOCATOR = YAML.load_file(File.open('../locators/forgot_pass.yml'))

  def pass_chnge_email
    button_click(LOCATOR['FRGT_PASS_BTN'])
    email_id = Constants::USERNAME_FORGOT_PROFILE
    type(LOCATOR['USERNAME_INPUT'], email_id)
    button_click(LOCATOR['SND_INST_BTN'])
  end

  def login(parameters = {})
    username	= parameters[:username] || Constants::USERNAME_FORGOT
    password	= parameters[:password] || Constants::OLD_PASS

    typenew(LOCATOR['USERNAME_INPUT'], username)
    typenew(LOCATOR['PASSWORD_INPUT'], password)
    button_click(LOCATOR['LOGIN_BUTTON'])
  end

  def change_pass_profile_pg(parameters = {})
    button_click(LOCATOR['BCK_LOGIN_BTN'])
    button_click(LOCATOR['PROFILE'])
    is_displayed?(LOCATOR['PRFL_HEADR'])
    # old_pass = parameters[:old_pass] || Constants::OLD_PASS
    old_pass = Constants::OLD_PASS
    new_pass = parameters[:new_pass] || Constants::PASSWORD_DEFAULT
    is_displayed?(LOCATOR['BCK_LOGIN_BTN'])
    type(LOCATOR['OLD_PASS'], old_pass)
    type(LOCATOR['NEW_PASS'], new_pass)
    type(LOCATOR['CNFRM_PASS'], new_pass)
    button_click(LOCATOR['SAVE_BTN'])

  end

  def login_again(parameters = {})
    username	= parameters[:username] || Constants::USERNAME_FORGOT
    password	= parameters[:password] || Constants::PASSWORD_DEFAULT

    typenew(LOCATOR['USERNAME_INPUT'], username)
    typenew(LOCATOR['PASSWORD_INPUT'], password)
    button_click(LOCATOR['LOGIN_BUTTON'])
  end
end