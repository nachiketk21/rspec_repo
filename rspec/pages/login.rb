# ================================================================
# Purpose:	Test the login page

	#Does work in Ruby:
		#@driver.find_element(id: 'login').displayed?.should == true
		#@driver.find_element(id: "login").displayed?.should == true
		#@driver.find_element(name:'login-form').displayed?.should == true
		#@driver.find_element(class:'login-links').displayed?.should == true
		#@driver.find_element(xpath:'html/body/div[2]/div/div/section/div/form/fieldset/div[1]/input').displayed?.should == true
		#@driver.find_element(xpath:'//section/div/form/fieldset/div[1]/input').displayed?.should == true
	#Does not work in Ruby:
		#@driver.find_element(tagName:'div').displayed?.should == true
		#@driver.find_element(linkText:'Features').displayed?.should == true
		#@driver.find_element(partialLinkText:'Features').displayed?.should == true
		#a[id='hrefID23'][name='hrefName23']
		#@driver.find_element(cssSelector:"").displayed?.should == true
# ================================================================

require_relative FileNames::LIB_COMMON_PAGE
#require_relative FileNames::PAGES_ACCOUNT
require_relative FileNames::LOCATORS_LOGIN


class Login < CommonPage
	LOCATOR = YAML.load_file(File.open(FileNames::LOCATORS_LOGIN))

	#Overwrite the base_page.visit()
	def visit(url_path = Paths::SS_URL)
		super
	end

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
    return is_displayed?(LOCATOR['ADD_NEW_SITE'])
  end
end