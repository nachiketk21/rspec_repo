require 'rspec'
require 'selenium-webdriver'
require '../spec/spec_helper'
require_relative '../helper/forgot_pass_helper'
require_relative '../helper/signup_helper'


describe 'Forgot password' do

  before :each do
    @driver = ForgotPassHelper.new Selenium::WebDriver.for :firefox
    @driver.window_maximize
  end

  after(:all) do
    @driver.quit
  end

  it 'should test forgot password' do
    @driver.frgt_pass_mail
    @driver.profile_renew_pass
  end
end