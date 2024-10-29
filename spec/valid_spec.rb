require 'rspec'

require_relative '../ip_validator'

RSpec.describe 'IP Validator' do
  describe '#valid_part' do
    it 'returns false for part longer than 3 digits' do
      expect(valid_part('256')).to be false
    end

    it 'returns false for part with non-digit characters' do
      expect(valid_part('12a')).to be false
    end

    it 'returns false for part with leading zero' do
      expect(valid_part('01')).to be false
    end

    it 'returns true for valid part' do
      expect(valid_part('192')).to be true
    end

    it 'returns false for part greater than 255' do
      expect(valid_part('256')).to be false
    end

    it 'returns false for negative number' do
      expect(valid_part('-1')).to be false
    end

    it 'returns true for part equal to 0' do
      expect(valid_part('0')).to be true
    end
  end

  describe '#is_valid_ip' do
    it 'returns false for nil input' do
      expect(is_valid_ip(nil)).to be false
    end

    it 'returns false for empty string' do
      expect(is_valid_ip('')).to be false
    end

    it 'returns false for IP with wrong number of parts' do
      expect(is_valid_ip('192.168.1')).to be false
      expect(is_valid_ip('192.168.1.1.1')).to be false
    end

    it 'returns false for invalid parts' do
      expect(is_valid_ip('192.168.1.256')).to be false
      expect(is_valid_ip('192.168.01.1')).to be false
      expect(is_valid_ip('192.168.a.1')).to be false
    end

    it 'returns true for valid IP' do
      expect(is_valid_ip('192.168.1.1')).to be true
    end
  end
end
