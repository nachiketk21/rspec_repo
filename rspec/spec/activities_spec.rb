require 'rspec'
require 'selenium-webdriver'
require_relative '../spec/spec_helper'
require_relative '../helper/activities_helper'

describe 'Activities test cases' do

    before :all do
      @driver = ActivitiesHelper.new Selenium::WebDriver.for :chrome
      @driver.window_maximize
    end

    after(:all) do
      @driver.quit
    end

    it 'should test all activities are present' do
      @driver.test_activities_tab
  end
end