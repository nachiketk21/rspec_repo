# ================================================================
# Purpose:	Methods for the signup spec file
# ================================================================

require_relative FileNames::PAGES_SIGNUP
require_relative '../config/paths'


class SignupHelper < SignUp

	def persnl_creds
    visit(Paths::SIGNUP)
    fill_form

=begin
    if pass==true
      success_message_present?.should == true
    else
      failure_message_present?.should == true
    end
=end
	end
end