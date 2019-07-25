require 'terminal-table'
require './store'
require './discount'
require './purchase'

class App
	def initialize
		Store.new	
		Discount.new
		Purchase.new
	end	
end

App.new