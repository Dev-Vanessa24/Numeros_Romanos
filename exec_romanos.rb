class RomanConverter
  ROMAN_MAP = {
    'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
    'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
    'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1
  }

  def self.roman_to_int(roman)
    value = 0
    i = 0
    while i < roman.length
      if i < roman.length - 1 && ROMAN_MAP[roman[i..i+1]]
        value += ROMAN_MAP[roman[i..i+1]]
        i += 2
      else
        value += ROMAN_MAP[roman[i]]
        i += 1
      end
    end
    value
  end

  def self.int_to_roman(number)
    result = ""
    ROMAN_MAP.each do |roman, val|
      while number >= val
        result << roman
        number -= val
      end
    end
    result
  end
end

puts "Digite um número (1-3999) ou um numeral romano:"
input = gets.chomp.upcase

if input.match?(/^\d+$/) && input.to_i.between?(1, 3999)
  puts "Convertido para Romano: #{RomanConverter.int_to_roman(input.to_i)}"
elsif input.match?(/^[IVXLCDM]+$/)
  puts "Convertido para Inteiro: #{RomanConverter.roman_to_int(input)}"
else
  puts "Entrada inválida!"
end
