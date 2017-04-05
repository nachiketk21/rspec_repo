#############################################################
# Test activities under profile tab
############################################################

require_relative '../lib/common_page'

class Activities<CommonPage
  LOCATOR = YAML.load_file(File.open('../locators/activities.yml'))

  def login_act
    authentication
  end

  def go_to_activities_tab
    sleep 3
    button_click(LOCATOR['PRL_TAB'])
    sleep 2
    button_click(LOCATOR['ACT_TAB'])
  end

  def check_activities
    sleep 2
    i = 1
    while i < 4 do
      act = @driver.find_element(:xpath , ".//*[@id='activities_list_base_div']/div[#{i}]/div/div/div[2]/div")
      p act.text
      i += 1
    end
  end

  def test_int_page
    
  end
end