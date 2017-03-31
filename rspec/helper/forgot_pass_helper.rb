require_relative '../config/paths'
require_relative '../pages/forgot_password'
require_relative '../pages/login'

# Tests to change password via profile page and via clicking on the link
class ForgotPassHelper < ForgotPassword
  def profile_renew_pass

    change_pass_profile_pg
  end

  def frgt_pass_mail
    visit(Paths::LOGIN)
    pass_chnge_email
  end
end