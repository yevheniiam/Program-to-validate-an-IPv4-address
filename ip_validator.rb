# ip_validator.rb
def valid_part(part)
  return false if part.length > 3
  return false unless part.match?(/\A\d+\z/)
  return false if part.start_with?('0') && part.length > 1
  num = part.to_i
  (0..255).include?(num)
end

def is_valid_ip(ip_str)
  return false if ip_str.nil? || ip_str.strip.empty?
  return false unless ip_str.count('.') == 3
  parts = ip_str.split('.')
  return false unless parts.length == 4
  parts.each do |part|
    return false unless valid_part(part)
  end
  true
end
# frozen_string_literal: true

