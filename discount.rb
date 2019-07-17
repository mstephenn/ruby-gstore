require './store'

class Discount
	def initialize
		add_discount
	end

	def add_discount
		puts "Do you want to add Discount for items (Y/N)"
		discount = gets.chomp
		if discount == "Y"
			puts "Select the register you want to give discounts"
			Store.register_detail.keys.map.with_index(1) { |e, indx| puts "#{indx}. #{e}" }
		else

		end
	end
end