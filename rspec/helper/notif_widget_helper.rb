require_relative '../config/paths'
require_relative '../pages/notif_widget'
require_relative '../pages/login'

class NotifWidgetHelper < NotificationWidget

  def check_notif_design
    visit(Paths::LOGIN)
    login_act
    open_notif_widgt
    check_desktop_design
  end
end