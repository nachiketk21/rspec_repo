require_relative '../config/paths'
require_relative '../pages/activities'
require_relative '../pages/login'

class ActivitiesHelper < Activities

  def test_activities_tab
    visit(Paths::LOGIN)
    login_act
    go_to_activities_tab
    check_activities
  end

end