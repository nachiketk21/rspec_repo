# ================================================================
# Purpose:	check all login combinations and see if it passes/fails as expected
# ================================================================
require_relative '../helper/login_helper'
require 'rspec'
require 'selenium-webdriver'
require '../spec/spec_helper'
require_relative '../lib/base_page'

RSpec.describe 'Test login page' do

  before(:all) do
    @driver = LoginHelper.new Selenium::WebDriver.for :firefox
    @driver.window_maximize
  end

  it 'should give error for wrong credentials' do
    @driver.negative_tests
  end

  it 'should login with correct credentials' do
    @driver.new_login
    @driver.quit
  end
end
