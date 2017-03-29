# ================================================================
# Purpose:	Methods for the spec file
# ================================================================

require_relative '../pages/login'
require_relative '../config/paths'

# Test cases written in this file
class LoginHelper < Login

  def new_login
    authentication
    check_landing_page
  end

  def negative_tests
    visit(Paths::LOGIN)
    incorrect_username
    incorrect_password
  end

  def quit
    @driver.quit
  end
end