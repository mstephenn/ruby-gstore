require 'terminal-table'
require './store'
require './discount'

class App
	def initialize
		Store.new	
		Discount.new
	end	
end

App.new