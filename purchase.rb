require "./store"
require "./customer"

class Purchase < Customer
	@@register_detail = Store.register_detail
	def initialize
		super()
		purchase_items
		calculate_purchased_items
	end

	def purchase_items
		puts "Select the item"
		Store.show_item_list
		selected_item = Store.rows[gets.chomp.to_i-1]
		select_quantity(selected_item)
	end

	def select_quantity(selected_item)
		puts "Enter the Quantities for #{selected_item[2]}"
		quantity = gets.chomp.to_i
		if quantity < selected_item[4].to_i
			@@customers[@@current_customer-1][:items] << { item_detail: selected_item, quantity: quantity }
		else
			puts "Exceeded the Quantity for #{selected_item[2]}. Please enter within (#{selected_item[4]}) quantity"
			select_quantity(selected_item)
		end
		puts "Do you want to add more items (Y/N)"
		if gets.chomp == "Y"
			purchase_items
		end
	end

	def calculate_purchased_items

	end
end