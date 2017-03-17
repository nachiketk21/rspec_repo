require_relative '../config/filenames'
require_relative FileNames::PAGES_SIGNUP
require_relative FileNames::LIB_COMMON_PAGE

class SignUp < CommonPage
  LOCATOR = YAML.load_file(File.open(FileNames::LOCATORS_SIGNUP))

  def fill_form(parameters = {})
    name	= parameters[:name] || Constants::FIRST_NAME_DEFAULT
    passwd	= parameters[:password] || Constants::PASSWORD_DEFAULT
    a = rand(9999)
    email_id = 'nachiket+'+"#{a}"+'@shopsocially.com'

    type(LOCATOR['NAME'], name)
    type(LOCATOR['EMAIL'], email_id)
    type(LOCATOR['PASSWORD'], passwd)
    button_click(LOCATOR['CONTINUE_BTN'])
    p is_displayed?(LOCATOR['ENTR_URL'])
    sleep 5
  end
end