class Store
	@@register_detail = {}
	@@rows = []
  # @@register_detail = {'Veggies': {'items': {'Tomato': {'count': 100, 'price': 2, 'name': 'Tomato'}, 'Carrot': {'count': 100, 'price': 7, 'name': 'Carrot'}}, 'name': 'Veggies'}, 'Fruits': {'items': {'orange': {'count': 100, 'price': 17, 'name': 'orange'}, 'Apple': {'count': 100, 'price': 23, 'name': 'Apple'}}, 'name': 'Fruits'}}

	def initialize
		create_register
		add_items_to_register
		Store.show_item_list
	end

	def create_register
		puts "Enter the register name"
		store_name=gets.chomp
		@@register_detail[store_name] = {items: []}
		puts "Do you want to add more registers (Y/N)"
		if gets.chomp == "Y"
			create_register
		end
	end

	def add_items_to_register(indx = nil)
		@register_detail_keys = self.class.register_detail_keys
		unless indx 
			puts "Please select register to add Items."
			list_registers = self.class.list_registers			
			if list_registers == true
				return true
			else				
				indx = list_registers[0]
				@register_detail_keys = list_registers[1]
			end
		end
		register = @@register_detail[@register_detail_keys[indx]]
		if register
			add_item_details(indx)
			puts "do u want to add more items (Y/N)"
			if gets.chomp == "Y"
				add_items_to_register(indx)
			else
				add_items_to_register
			end			
		else
			add_items_to_register
		end
	end

	def add_item_details(indx)
		puts "enter item name"
		item_name = gets.chomp
		puts "enter item price"
		item_price = gets.chomp
		puts "total no of item stock"
		item_count = gets.chomp
		@@register_detail[@register_detail_keys[indx]][:items] << { item_name: item_name, item_price: item_price, item_count: item_count }
	end

	def self.show_item_list		
		@@rows = []
		reg_hash = Store.register_detail_keys.include?(:employee_discount) ? @@register_detail.dup.delete(:employee_discount) : @@register_detail
		reg_hash.each.with_index(1) { |register, idx| register[1][:items].each { |item| @@rows << [@@rows.size+1, register[0], item[:item_name], item[:item_price], item[:item_count]] } }
		table = Terminal::Table.new :title => "Items List", :headings => ['No', 'Register Name', 'Item Name', 'Item Price', 'Stock'], :rows => @@rows
		puts table
	end

	def self.register_detail_keys
		@@register_detail.keys
	end

	def self.list_registers	
		register_detail_keys = self.register_detail_keys << "Back"
		register_detail_keys.each.with_index(1) { |reg_name, index| puts "#{index}. #{reg_name}" } 
		indx = gets.chomp.to_i		
		if indx == (register_detail_keys.index("Back") + 1)
			return true
		else				
			indx -= 1
		end	
		register_detail_keys.pop		
		return indx, register_detail_keys;
	end

	def self.register_detail
		@@register_detail
	end

	def self.rows
		@@rows
	end
end