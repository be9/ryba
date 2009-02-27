module Ryba
  def self.numerify(number_string)
    number_string.gsub('#') { rand(10).to_s }
  end

  def self.pick(variants)
    case variants
    when Array
      variants[rand(variants.size)]
    when String
      variants[rand(variants.length),1]
    when Range
      variants.begin + rand(variants.end - variants.begin + 1)
    end
  end
end

require File.join(File.dirname(__FILE__), 'ryba', 'data')
require File.join(File.dirname(__FILE__), 'ryba', 'name')
require File.join(File.dirname(__FILE__), 'ryba', 'phone_number')
require File.join(File.dirname(__FILE__), 'ryba', 'address')
