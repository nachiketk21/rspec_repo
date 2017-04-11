################################################
# Test cases for rewards tab
################################################

require_relative '../lib/common_page'

class Rewards < CommonPage
  LOCATOR = YAML.load_file(File.open('../locators/rewards.yml'))
  COMM = YAML.load_file(File.open('../locators/common.yml'))

  def open_rewards
    sleep 3
    button_click(COMM['PRL_TAB'])
    sleep 2
    button_click(LOCATOR['RWDS_TAB'])
  end

  def check_rewards_tab
    g = count_elements(LOCATOR['ALL_RWDS'])
    i = 1
    arr = %w[RDM_TYP PR_DIS DIS_NM DES PTS_DEC]
    while i < g do
      # rwd_nm = @driver.find_element(xpath: ".//*[@id='rewards_list_base_div']/div[#{i}]/div/div/div[2]/div")
      @driver.find_element(:xpath, ".//*[@id='rewards_list_base_div']/div[#{i}]/div/div/div[4]/div[1]").click
      sleep 2
      j = 0
      while j < arr.size do
        ab = find(LOCATOR[arr[j]])
        ab.attribute :value
        j += 1
      end
      manage_codes
      button_click(LOCATOR['SETTING'])
      button_click(LOCATOR['CANC'])
      sleep 2
      i += 1
    end
  end

  def manage_codes
    button_click(LOCATOR['MNGE_CODES'])
    ttl_cpn = text_present(LOCATOR['TTL_CODE'])
    cpns = ttl_cpn.scan /\d/
    if cpns[0].to_i <= 9
      $ttl = cpns[0]
    else
      $ttl = cpns[0] + cpns[1]
    end
    p 'Total no to check ' + $ttl
    if $ttl.to_i < 5
      cpn_pr_page = finds(LOCATOR['CPN_CDE'])
      p 'Total coupons found ' + cpn_pr_page.size.to_s if cpn_pr_page.size == $ttl.to_i
    else
      chk_cpn_code_no
    end
  end

  def chk_cpn_code_no
    cpn_pr_page = finds(LOCATOR['CPN_CDE'])
    # button_click(LOCATOR['NXT_CPN'])
    sleep 2
    i = 0
    $j = []
    k = $ttl.to_i / 5
    while i < k do
      total_cpns
      i += 1
    end
    cpn_pr = cpn_pr_page.size + $j.inject(:+)
    p 'Total coupons found ' + cpn_pr.to_s if cpn_pr == $ttl.to_i
  end

  def total_cpns
    btn = finds(LOCATOR['NXT_BTN']).size
    ele = @driver.find_element(:xpath, ".//*[@id='page-selection']/ul/li[#{btn}]/a")
    ele.click
    el = finds(LOCATOR['CPN_CDE'])
    $j << el.size
  end
end