# ================================================================
# Purpose:	set of common methods that is relevant only to https://saucelabs.com
# ================================================================

require 'uri'
require 'yaml'
require_relative FileNames::LIB_BASE_PAGE


class CommonPage < BasePage

	def initialize(driver)
		super
	end

	def visit(url_path)
		if url_path =~ URI::regexp
			# Correct URL (ex: http://www.google.com)
			super
		else
			# Partial URL (ex: /login)
			super(Constants::BASE_URL + url_path)
		end
	end

	def logout
		visit(Paths::LOGOUT)
	end
end