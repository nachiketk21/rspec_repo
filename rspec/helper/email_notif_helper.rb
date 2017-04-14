require_relative '../config/paths'
require_relative '../pages/email_notif'
require_relative '../pages/login'

class EmailNotifHelper < EmailNotification

  def email_template
    visit(Paths::LOGIN)
    login_act
    open_notif
    get_all_tabs
  end
end