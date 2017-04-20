require 'rspec'
require 'selenium-webdriver'
require_relative '../spec/spec_helper'
require_relative '../helper/rewards_helper'
require_relative '../helper/signup_helper'


describe 'Rewards test cases' do

  before :each do
    @driver = RewardsHelper.new Selenium::WebDriver.for :firefox
    @driver.window_maximize
  end

  after(:all) do
    @driver.quit
  end

  it 'should test all rewards are present' do
    @driver.test_rewards
  end
end