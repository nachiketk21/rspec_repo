require 'rspec'
require 'selenium-webdriver'
require '../spec/spec_helper'
require_relative '../helper/email_notif_helper'
#require_relative '../helper/signup_helper'

describe 'Email notification' do

  before :each do
    @driver = EmailNotifHelper.new Selenium::WebDriver.for :firefox
    @driver.window_maximize
  end

  it 'should Edit,toggle status & save email templates' do
    @driver.email_template
    @driver.quit
  end
end