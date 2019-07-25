class Customer
	@@customers = []
	@@current_customer = 0
	def initialize
		add_customer
	end

	def add_customer
		customer = {}
		puts "Please Enter Customer name"
		customer[:name] = gets.chomp
		puts "Please Enter Customer Age"
		customer[:age] = gets.chomp
		puts "Please Enter Customer contact No."
		customer[:contact_no] = gets.chomp
		customer[:items] = []
		@@customers << customer
		@@current_customer = @@customers.size
	end
end