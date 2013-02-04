class HomeController < ApplicationController
	def index
		#typical home page cruft
	end

	def login
		#present Strava Login page here
	end

	def welcome
		#if login status is 200, show, else return to login with error
	end
end
