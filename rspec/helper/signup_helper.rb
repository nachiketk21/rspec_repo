# ================================================================
# Purpose:	Methods for the signup spec file
# ================================================================

require_relative FileNames::PAGES_SIGNUP
require_relative '../config/paths'


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
    driver.quit
  end

end