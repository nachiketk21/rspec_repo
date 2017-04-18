require_relative '../lib/common_page'

###################################################################
# Test cases for notification widget
##################################################################
class NotificationWidget  < CommonPage
  LOCATOR = YAML.load_file(File.open('../locators/notif_widget.yml'))
  COMM = YAML.load_file(File.open('../locators/common.yml'))

  def open_notif_widgt
    sleep 3
    button_click(COMM['DESIGN_TAB'])
    sleep 2
    button_click(LOCATOR['NOTF_WIGT_TB'])
    sleep 3
    p is_displayed?(LOCATOR['DESKTP_TITLE'])
  end

  def check_desktop_design
    typenew(LOCATOR['D_THEME_COLR'], '#881a53')
    typenew(LOCATOR['D_FONT_COLR'], '#141313')
    button_click(LOCATOR['D_TXT'])
    typenew(LOCATOR['D_TXT'], 'Rewards')
    select(LOCATOR['BTN_PLCE'],'Right')
    fnt_clr = find(LOCATOR['D_FONT_BTN_CLR'])
    ele2 = fnt_clr.attribute :style
    bg_clr = find(LOCATOR['D_BCKGRD_CLR'])
    app_clr = find(LOCATOR['D_APPLIED_CLR'])
    ele = app_clr.attribute :style
    ele1 = bg_clr.attribute :style
    p ele.include? ele1
    p ele.include? ele2
  end
end