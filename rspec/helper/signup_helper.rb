# ================================================================
# Purpose:	Methods for the signup spec file
# ================================================================

require_relative '../pages/signup'
require_relative '../config/paths'

# Helper class for signup
class SignupHelper < SignUp

  def persnl_creds
    visit(Paths::SIGNUP)
    fill_form
    first_screen
    second_screen
    add_coupons_screen
    theme
  end

  def quit
    @driver.quit
  end

end