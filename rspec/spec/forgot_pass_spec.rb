require 'rspec'
require 'selenium-webdriver'
require_relative '../spec/spec_helper'
require_relative '../helper/forgot_pass_helper'
require_relative '../helper/signup_helper'


describe 'Forgot password' do

  before :all do
    @driver = ForgotPassHelper.new Selenium::WebDriver.for :firefox
    @driver.window_maximize
  end

  after(:all) do
    @driver.quit
  end

  it 'should test forgot password by email' do
    p 'Forgot password test start'
    @driver.frgt_pass_mail
  end

  it 'should change password through the profile page' do
    @driver.profile_renew_pass
    p '****************************'
  end
end