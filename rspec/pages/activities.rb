require_relative '../lib/common_page'

#############################################################
# Test activities under profile tab
############################################################

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
      if i == 'BB_EDIT'
       edit_act($all_ele)
       save_act
       cancel_act
      else
        edit_act($all_ele)
        save_act
        acc_creation_rules
        cancel_act
      end
    end
    button_click(LOCATOR['WINBCK_EDIT'])
    sleep 2
    edit_act($win_bk)
    save_act
    cancel_act
    raf
  end

  def save_act
    button_click(LOCATOR['SAVE_ACT'])
    sleep 2
  end

  def cancel_act
    button_click(LOCATOR['CNCL_ACT'])
    sleep 1
  end

  def raf
    button_click(LOCATOR['RAF_EDT_BTN'])
    sleep 2
    ele = %w[ACT_NAME ACT_DESP PTS_PR_ACT RAF_CPN RAF_IMG_UPLOAD RAF_FB_TITLE RAF_FB_DESP RAF_TWEET]
    edit_act(ele)
    save_act
    cancel_act
  end

  def rules_engine(type, type_val, dd1, dd2, date, rul_cond)
    select(LOCATOR['RULS_TYP'], type)
    typenew(LOCATOR['RUL_VAL'], type_val)
    select(LOCATOR['RUL_CNDTN_1'], dd1)
    select(LOCATOR['RUL_CNDTN_2'], dd2)
    typenew(LOCATOR['RUL_DT'], date)
    select(LOCATOR['RUL_INPT'], rul_cond)
  end

  def open_rules_tab
    button_click(LOCATOR['MNG_RULS_TB'])
    sleep 3
  end

  def add_rule
    button_click(LOCATOR['ADD_CNDTN'])
  end

  def delete_rule
    button_click(LOCATOR['DEL_CNDTN'])
  end

  def date_selector
    today = Time.new.strftime('%d/%m/%Y')
    last_mon = Time.new.to_datetime.prev_month.strftime('%d/%m/%Y')
    $date = last_mon + '-' + today
  end

  def acc_creation_rules
    open_rules_tab
    rules_engine('Fixed Points', '10','Enrollment Date', 'Between', $date, 'AND')
    button_click(LOCATOR['SAVE_RULE'])
    sleep 3
    button_click(LOCATOR['SETTING_TB'])
  end
end