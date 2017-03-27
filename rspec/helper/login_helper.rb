# ================================================================
# Purpose:	Methods for the spec file
# ================================================================

require_relative '../pages/login'
require_relative '../locators/login.yml'

# Test cases written in this file
class LoginHelper < Login

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