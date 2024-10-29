# main.rb
require_relative 'ip_validator'

puts "Введите IP-адресу для проверки:"
ip_input = gets.chomp
puts is_valid_ip(ip_input) ? "Valid" : "Not valid"
