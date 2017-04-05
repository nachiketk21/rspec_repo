require 'rspec'
require 'selenium-webdriver'
require '../spec/spec_helper'
require_relative '../helper/activities_helper'
require_relative '../helper/signup_helper'


describe 'Activities test cases' do

    before :each do
      @driver = ActivitiesHelper.new Selenium::WebDriver.for :firefox
      @driver.window_maximize
    end

    it 'should test all activities are present' do
      @driver.test_activities_tab
      @driver.quit
  end
end