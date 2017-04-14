require_relative '../lib/common_page'

class EmailNotification < CommonPage
  LOCATOR = YAML.load_file(File.open('../locators/email_notif.yml'))
  COMM = YAML.load_file(File.open('../locators/common.yml'))

  def open_notif
    sleep 3
    button_click(COMM['NOTIF_TAB'])
    sleep 2
    button_click(LOCATOR['EMAIL_TAB'])
  end

  def get_all_tabs
    i = 1
    while i < 5 do
      arr = @driver.find_element(:xpath, ".//*[@id='notification_loyalty_container']/div[#{i}]/div/div/div[1]/div")
      p arr.text
      # click_slider(i)
      click_edit_tab(i)
      edit_email
      i += 1
    end
  end

  def click_edit_tab(tmp)
    ele = "div/div/div[3]/div[1]"
    ed = @driver.find_element(:xpath, ".//*[@id='notification_loyalty_container']/div[#{tmp}]/"+ele)
    ed.click
  end

  def edit_email
    button_click(LOCATOR['EDIT_MAIL_BTN'])
    button_click(LOCATOR['SAVE_BTN'])
    sleep 3
    is_displayed?(LOCATOR['ALRT_MSG'])
    button_click(LOCATOR['CLSE_MSG'])
    button_click(LOCATOR['TOGL_INSDE'])
    sleep 3
    button_click(LOCATOR['TOGL_INSDE'])
    sleep 3
    button_click(LOCATOR['CLSE_TPLT'])
    sleep 2
  end

  def click_slider(tgl)
    ele = "div/div/div[3]/div[2]/label"
    ed = @driver.find_element(:xpath, ".//*[@id='notification_loyalty_container']/div[#{tgl}]/"+ele)
    2.times ed.click
  end
end