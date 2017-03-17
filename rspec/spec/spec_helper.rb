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

ssh-rsa AAAAB4NzaC1yc2EAAAADAQABAAABAQDDcvntOICMfFlhmp9K3Sg0DbmtxdKr4fZ7LWZN8GyYU9YULXpW4qBYdKUrEFzts0W4bR9ntgfmDX5+iq9pbgNTZrByV8YH4e9nvb/VB4e2gDRSgD2TbIIbj0Z4Ay+MEV4IyHdihNWdvlRPYagOPsyEa4YCwT2v+fXVqT8lmwDHC+PGZXcfqkhf6Ojr2ZPpsVRC7mjSdGZZ9ruA6sqxhDYhFOAVwcLcvPFU7Z1u3c5NoIGfo5uH1pWOhsrzCtlfEMu2tkE+Fb4lurzLydV0cNUm3Iu4gQX3iFdtQNyUxkmbfwm2xYP4JEXRCiM6EfJTdINbtrRabPGeXfLXzQW081Mh nachiketk21@gmail.com
