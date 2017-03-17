# ================================================================
# Purpose:	check all login combinations and see if it passes/fails as expected
# ================================================================

require_relative 'spec_helper'
require_relative FileNames::HELPER_LOGIN


describe 'Test login page' do
	before(:each) do
    @driver = Selenium::WebDriver.for :firefox
		@loginHelper = LoginHelper.new(@driver)
  end

	after(:all) do
    @driver.quit
	end

	it 'positive-email' do
		print "RUNNING TEST: positive-email\n"
    @loginHelper.new_login

		#@loginHelper.test(true, :username => Constants::EMAIL_DEFAULT)
  end
end