require_relative '../config/paths'
require_relative '../pages/rewards'
require_relative '../pages/login'
# require_relative '../pages/activities'

class RewardsHelper < Rewards

  def test_rewards
    visit(Paths::LOGIN)
    login_act
    open_rewards
    check_rewards_tab
  end
end