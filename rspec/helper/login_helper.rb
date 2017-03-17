# ================================================================
# Purpose:	Methods for the spec file
# ================================================================

require_relative FileNames::PAGES_LOGIN
#require_relative FileNames::LOCATORS_LOGIN
#require_relative '../locators/login.yml'

class LoginHelper < Login
	#Optional hash parameter so that you can override one or more defaults if needed
  LOCATOR = YAML.load_file(File.open(FileNames::LOCATORS_LOGIN))

  def driver
    @driver
  end

	def new_login
		visit
    window_maximize
    authentication
  end

  def go_to_site
    check_landing_page
  end

  def logout
    driver.quit
  end
end