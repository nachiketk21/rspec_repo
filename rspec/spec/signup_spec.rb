require 'rspec'
require 'selenium-webdriver'
require '../spec/spec_helper'
require_relative '../helper/signup_helper'

RSpec.describe 'New sign up on zinrelo' do

  before :each do
    @driver = SignupHelper.new(Selenium::WebDriver.for (:firefox))
    @driver.window_maximize
    #@signup = SignupHelper.new(@zin)
  end

  after :all do
    @driver.quit
  end

  it 'should signup and create a new user' do
    @driver.persnl_creds
  end
end