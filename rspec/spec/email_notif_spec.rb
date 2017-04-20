require 'rspec'
require 'selenium-webdriver'
require_relative '../spec/spec_helper'
require_relative '../helper/email_notif_helper'


describe 'Email notification' do

  before :each do
    @driver = EmailNotifHelper.new Selenium::WebDriver.for :firefox
    @driver.window_maximize
  end

  after(:all) do
    @driver.quit
  end

  it 'should Edit,toggle status & save email templates', :smoke do
    @driver.email_template
  end
end