require 'rspec'
require 'selenium-webdriver'
require_relative '../spec/spec_helper'
require_relative '../helper/notif_widget_helper'

describe 'Notification Widget' do

    before :each do
      @driver = NotifWidgetHelper.new Selenium::WebDriver.for :chrome
      @driver.window_maximize
    end

    after(:all) do
      @driver.quit
    end

    it 'should Check the design applied ' do
      @driver.check_notif_design
  end
end