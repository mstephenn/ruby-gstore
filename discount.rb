require './store'

class Discount
	@@register_detail = Store.register_detail
	def initialize
		add_discount
		Store.show_item_list
	end

	def add_discount
		discount(:store_employees)
		discount(:senior_citizens)
		puts "Do you want to add Discount for items (Y/N)?"
		discount = gets.chomp
		if discount == "Y"
			puts "Select the register you want to give discounts"
			Store.register_detail_keys.map.with_index(1) { |e, indx| puts "#{indx}. #{e}" }
			optn = gets.chomp.to_i-1
			puts "Enter the discount percentage for #{Store.register_detail_keys[optn]}"
			@@register_detail[Store.register_detail_keys[optn]][:discount] = gets.chomp			
		end
	end

	def discount(type)
		type = type.to_s.split("_").map { |e| e.capitalize }.join(" ")
		puts "Are you giving Discount for #{type} (Y/N)?"
		if gets.chomp == "Y"
			puts "Enter the discount percentage for #{type}"
			@@register_detail[type] = gets.chomp
		end
	end
end