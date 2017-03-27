# ================================================================
# Purpose:	Test the login page
# ================================================================

require_relative '../lib/common_page'
# require_relative FileNames::PAGES_ACCOUNT
require_relative '../locators/login.yml'

class Login < CommonPage
	LOCATOR = YAML.load_file(File.open('../locators/login.yml'))


	def check_page
		return is_displayed?(LOCATOR['USERNAME_INPUT']) && is_displayed?(LOCATOR['PASSWORD_INPUT']) &&  is_displayed?(LOCATOR['SUBMIT_BUTTON'])
	end

	def success_message_present?
		account	= Account.new(@driver)
		return account.check_page
	end

	def failure_message_present?
		return is_displayed?(LOCATOR['FAILURE_PAGE'])
	end


	def authentication(parameters = {})
		username	= parameters[:username] || Constants::USERNAME_DEFAULT
		password	= parameters[:password] || Constants::PASSWORD_DEFAULT

		type(LOCATOR['USERNAME_INPUT'], username)
		type(LOCATOR['PASSWORD_INPUT'], password)
		submit(LOCATOR['SUBMIT_BUTTON'])
  end

  def check_landing_page
    p is_displayed?(LOCATOR['ADD_NEW_SITE'])
  end
end