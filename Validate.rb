# Метод для перевірки, чи є частина IP-адреси дійсною
def valid_part(part)
  return false if part.length > 3

  # Перевіряємо, чи складається частина лише з цифр
  return false unless part.match?(/\A\d+\z/)

  # Відкидаємо ведучі нулі
  return false if part.start_with?('0') && part.length > 1

  # Перетворюємо частину в число
  num = part.to_i
  # Перевіряємо, чи знаходиться число в діапазоні від 0 до 255
  (0..255).include?(num)
end

# Метод для перевірки, чи є рядок дійсною IP-адресою
def is_valid_ip(ip_str)
  return false if ip_str.nil? || ip_str.strip.empty? # Додано перевірку на пропуски

  # Додана перевірка на кількість крапок
  return false unless ip_str.count('.') == 3

  parts = ip_str.split('.')

  # Перевіряємо, чи є рівно 4 частини
  return false unless parts.length == 4

  # Перевіряємо кожну частину
  parts.each do |part|
    return false unless valid_part(part) # Якщо частина недійсна, повертаємо false
  end

  true # Якщо всі частини валідні, повертаємо true
end

# Запитуємо у користувача IP-адресу
puts "Введіть IP-адресу для перевірки:"
ip_input = gets.chomp

# Виводимо результат перевірки
puts is_valid_ip(ip_input) ? "Valid" : "Not valid"
