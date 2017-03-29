# UTF-8
# ================================================================
# Purpose:	set of Selenium methods that should universally work on all websites
# ================================================================

require 'open-uri'

# This is a base class
class BasePage

  def initialize(driver)
    @driver = driver # = super(driver)
    @driver.manage.timeouts.implicit_wait	= 20
  end

  def quit
    @driver.quit
  end

  # ----------------------------------------------------------------
  # Windows
  # ----------------------------------------------------------------
  def visit(url_path)
    @driver.get url_path
  end

  def current_url
    @driver.current_url
  end

  def window_maximize
    @driver.manage.window.maximize
  end

  def window_resize(parameters = {})
    height	= parameters[:height] || Constants::WINDOW_HEIGHT_DEFAULT
    width	= parameters[:width] || Constants::WINDOW_WIDTH_DEFAULT
    @driver.manage.window.resize_to(height, width)
  end

  # Locators ----------------------------------------------------------------

  def find(locator)
    @driver.find_element(locator)
  end

  def finds(locator)
    @driver.find_elements(locator)
  end

  def count_elements(locator)
    @driver.find_elements(locator).size
  end

  # Verify ----------------------------------------------------------------

  def is_displayed?(locator)
    wait_for(locator)
    begin
      return find(locator).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      return 'No element found:' "#{locator}"
    end
  end

  def text_displayed?(locator, element_text)
    wait_for(locator)
    begin
      return find(locator).text.include?(element_text)
    rescue
      return false
    end
  end

  def text_present(locator)
    find(locator).text
  end

  # Forms: input, buttons & select ---------------------------------------------
  def typenew(locator, text)
    clear(locator)
    find(locator).send_keys(text)
  end

  def type(locator, text)
    wait_for(locator)
    find(locator).send_keys(text)
  end

  def clear(locator)
    find(locator).clear
  end

  def select(locator, option_text)
    dropdown = find(locator)
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.select_by(:text, option_text)
  end

  def click_chkbox(locator, parameters = {})
    wait_for(locator)
    checkbox		= parameters[:check] || 'null'

    if checkbox=='true' || checkbox=='1'
      locator.clear
      find(locator).click
    elsif checkbox=='false' || checkbox=='0'
      locator.clear
    else
      find(locator).click
    end
  end

  def button_click(locator)
    wait_for(locator)
    find(locator).click
  end


  # Wait ----------------------------------------------------------------
  # def wait_for(seconds = 15)
  # 	Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  # end

  def wait_for(locator)
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    begin
      wait.until { find(locator) }
      return true
    rescue
      return false
    end
  end

  # Other methods ----------------------------------------------------------------

  def scroll_down(locator)
    ele = find(locator)
    ele.location_once_scrolled_into_view
  end
end