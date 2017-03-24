# ================================================================
# Purpose:	This is a standard in the industry according to the book "Instant RSpec Test-Driven Development How-to" and some website
# ================================================================

require 'selenium-webdriver'
require_relative '../config/constants'
require_relative '../config/filenames'
require_relative '../config/paths'


RSpec.configure do |config|
	config.include Constants
	config.include FileNames
	config.include Paths

	config.before(:each) do
		case ENV['browser']
		when 'firefox'
			@driver = Selenium::WebDriver.for :firefox
			@driver.manage.timeouts.implicit_wait	= 60
		when 'chrome'
			Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, '../vendor/chromedriver')
			@driver = Selenium::WebDriver.for :chrome
		end
  end

  # config.after(:all) do
		# @driver.quit
  # end
end




	# ================================================================
	# Purpose:	just to run any test
	# ================================================================

# 	require_relative 'spec_helper'
# 	# noinspection RubyResolve
# 	require_relative FileNames::LIB_BASE_PAGE
#
#
# 	describe 'Test login page' do
#
#
# 		before(:each) do
# 			@driver = Selenium::WebDriver.for :firefox
# 			@basePage				= BasePage.new(@driver)
# 		end
#
# 		after(:each) do
# 		end
#
# 		it 'positive-username' do
# 			print "TEST\n"
# 			@basePage.visit('http://www.w3schools.com/html/default.asp')
# 		end
# 	end
# end
