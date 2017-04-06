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

  def sel_actv
    i = 2
    while i < 4 do
      act = @driver.find_element(:xpath , ".//*[@id='activities_list_base_div']/div[#{i}]/div/div/div[4]/div[2]/label")
      act.click
    end
  end
# This method opens the page with integration.
  # To do
  # Need to write a method to check the activities on the page
  def test_int_page
    open_new_tab(Constants::INT_PAGE)
    sleep 5
    button_click(LOCATOR['RWDS_TAB'])
    switch_frame
    button_click(LOCATOR['ERN_PTS'])
    p text_displayed?(LOCATOR['ACT_NM'], 'Account Creation')
    switch_back
    @driver.close
  end

  def edit_act
    all_ele = %w[ACT_NAME ACT_DESP NOTF_TXT PTS_PR_ACT]
    all_ele.each do |i|
       ele = find(LOCATOR["#{i}"]).attribute ('value')
       typenew(LOCATOR["#{i}"], ele)
       is_displayed?(LOCATOR['ACT_ID'])
    end
  end

# Edit and check all fields in the editing of the activities
  def edit_all_act
    edit = %w[CRTN_EDIT PUR_ON_WEB_EDIT BB_EDIT]
    edit.each do |i|
      button_click(LOCATOR["#{i}"])
      edit_act
      button_click(LOCATOR['SAVE_ACT'])
      sleep 2
      button_click(LOCATOR['CNCL_ACT'])
      sleep 1
    end
  end
end