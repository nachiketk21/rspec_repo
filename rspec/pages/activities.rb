#############################################################
# Test activities under profile tab
############################################################

require_relative '../lib/common_page'

class Activities < CommonPage
  LOCATOR = YAML.load_file(File.open('locators/activities.yml'))
  COMM = YAML.load_file(File.open('locators/common.yml'))
  $all_ele = %w[ACT_NAME ACT_DESP NOTF_TXT PTS_PR_ACT]
  $win_bk = %w[ACT_NAME ACT_DESP PTS_PR_ACT INACT_PRD]

  def login_act
    authentication
  end

  def go_to_activities_tab
    sleep 3
    button_click(COMM['PRL_TAB'])
    sleep 2
    button_click(LOCATOR['ACT_TAB'])
  end

  def check_activities
    sleep 2
    i = 1
    while i < 6 do
      act = @driver.find_element(:xpath , ".//*[@id='activities_list_base_div']/div[#{i}]/div/div/div[2]/div")
      p act.text
      i += 1
    end
  end

  def sel_actv
    i = 1
    while i < 6 do
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

  def edit_act(arr)
    arr.each do |i|
       ele = find(LOCATOR["#{i}"]).attribute ('value')
       typenew(LOCATOR["#{i}"], ele)
       is_displayed?(LOCATOR['ACT_ID'])
    end
  end

# Edit and check all fields in the editing of the activities
  # TO DO - Check setting saved message
  # Winback edit and preview email
  def edit_all_act
    edit = %w[CRTN_EDIT PUR_ON_WEB_EDIT BB_EDIT]
    edit.each do |i|
      button_click(LOCATOR["#{i}"])
      edit_act($all_ele)
      save_cancel_act
    end
    button_click(LOCATOR['WINBCK_EDIT'])
    sleep 2
    edit_act($win_bk)
    save_cancel_act
    raf
  end

  def save_cancel_act
    button_click(LOCATOR['SAVE_ACT'])
    sleep 2
    button_click(LOCATOR['CNCL_ACT'])
    sleep 1
  end

  def raf
    button_click(LOCATOR['RAF_EDT_BTN'])
    sleep 2
    ele = %w[ACT_NAME ACT_DESP PTS_PR_ACT RAF_CPN RAF_IMG_UPLOAD RAF_FB_TITLE RAF_FB_DESP RAF_TWEET]
    edit_act(ele)
    save_cancel_act
  end
end