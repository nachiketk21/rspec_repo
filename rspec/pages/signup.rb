require_relative '../lib/common_page'

# All methods for signup tests
class SignUp < CommonPage
  LOCATOR = YAML.load_file(File.open('locators/signup.yml'))

  def fill_form(parameters = {})
    name	= parameters[:name] || Constants::FIRST_NAME_DEFAULT
    passwd	= parameters[:password] || Constants::PASSWORD_DEFAULT
    $a = rand(9999)
    email_id = "nachiket+#{$a}@shopsocially.com"
    # email_id = 'adityapingle2017@gmail.com'

    type(LOCATOR['NAME'], name)
    type(LOCATOR['EMAIL'], email_id)
    type(LOCATOR['PASSWORD'], passwd)
    button_click(LOCATOR['CONTINUE_BTN'])
    p is_displayed?(LOCATOR['ENTR_URL'])
    sleep 2
  end

  def first_screen
    store_name = 'Zinrelo store'+"#{$a}"
    store_url = Constants::STORE_URL
    lylty_nm = Constants::LOYALTY_PROG

    type(LOCATOR['NAME'], store_name)
    type(LOCATOR['ENTR_URL'], store_url)
    type(LOCATOR['LOYLTY_PRGM_NM'], lylty_nm)
    button_click(LOCATOR['FRST_SCN_NXT'])
  end

  def second_screen
    text_displayed?(LOCATOR['ACC_CREATN_TEXT'], 'Account Creation')
    2.times { button_click(LOCATOR['ACC_CREATN_TGL']) }
    2.times { button_click(LOCATOR['PUR_ON_WEB_TGL']) }
    2.times { button_click(LOCATOR['BIRTH_BONUS_TGL']) }
    2.times { button_click(LOCATOR['RAF_TGL']) }

    button_click(LOCATOR['SCND_SCN_NXT'])
  end

  def add_coupons_screen
    header_txt = ['5% Off Coupon for 50 points', '2% Off Coupon for 20 points',
                  '2% Off Coupon for 5 points', '$10 Off Coupon for 100 points']
    j = 1
    header_txt.each do |i|
      hdr = find(LOCATOR["#{j}_CPN"]).text
      puts "#{hdr} " + 'Text present' if hdr == i
      j += 1
      end
    send_coupons
  end

  def send_coupons
    enter_cpn_codes(0, 2, '1_CPN_ADD', '1_CPN_CODES', '1_CPN_CODES_BTN')
    enter_cpn_codes(2, 4, '2_CPN_ADD', '2_CPN_CODES', '2_CPN_CODES_BTN')
    enter_cpn_codes(4, 6, '3_CPN_ADD', '3_CPN_CODES', '3_CPN_CODES_BTN')
    enter_cpn_codes(6, 9, '4_CPN_ADD', '4_CPN_CODES', '4_CPN_CODES_BTN')

    button_click(LOCATOR['THRD_SCN_BTN'])
  end

  def enter_cpn_codes(arr, max_arr, opn_txt_bx, etr_cd, ad_btn)
    codes = %w(z i n r e l o r f)
    i = arr
    button_click(LOCATOR["#{opn_txt_bx}"])
    scroll_down(LOCATOR["#{etr_cd}"])
    scroll_down(LOCATOR["#{ad_btn}"])
    while i < max_arr do
      type(LOCATOR["#{etr_cd}"], "#{codes[i]}")
      type(LOCATOR["#{etr_cd}"], :return)
      i += 1
    end
    button_click(LOCATOR["#{ad_btn}"])
  end

  def theme
    sleep 3
    themes = %w(UBER_COOL SPRING OCEAN SUMMER BERRY CLASSIC LIMESTN GRACE)
    theme_names = %w(uber_cool spring ocean summer berry
                     classic limestone grace)
    j = 0
    themes.each do |i|
      button_click(LOCATOR[i])
      theme_col = find(LOCATOR['DATA_COL']).attribute 'data-color'
      theme_names[j] == theme_col
      j += 1
    end
    button_click(LOCATOR['FOURTH_SCN_BTN'])
    sleep 5
  end
end