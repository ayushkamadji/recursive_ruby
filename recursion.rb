def factorial(n)
  return 1 if n == 0
  n * factorial(n-1)
end

def is_palindrome?(chars)
  return true if chars.length <= 1
  chars[0] == chars[-1] && is_palindrome?(chars[1..chars.length-2])
end

def beers_on_the_wall(n)
  return puts "no more bottles of beer on the wall" if n <= 0
  puts "#{n} bottles of beer on the wall"
  beers_on_the_wall(n-1)
end

def fibonacci_at(n)
  return 0 if n == 0
  return 1 if n == 1
  fibonacci_at(n - 1) + fibonacci_at(n - 2)
end

def flatten(ary, accu=[])
  ary.each do |e|
    unless e.is_a? Array
      accu << e
    else
      flatten(e, accu)
    end
  end
  return accu
end
   
$int_to_rom = {
	1000 	=> 'M',
	900	=> 'CM',
	500	=> 'D',
	400	=> 'CD',
	100	=> 'C',
	90	=> 'XC',
	50	=> 'L',
	40	=> 'XL',
	10	=> 'X',
	9	=> 'IX',
	5	=> 'V',
	4	=> 'IV',
	1	=> 'I'
}    
def integer_to_roman(n)
  return "" if n == 0
  key = $int_to_rom.each_key.find { |k| k <= n }
  return String.new($int_to_rom[key]) << integer_to_roman(n - key)
end

$rom_to_int = {
	'M'	=> 1000,
	'CM'	=> 900,
	'D'	=> 500,
	'CD'	=> 400,
	'C'	=> 100,
	'XC'	=> 90,
	'L'	=> 50,
	'XL'	=> 40,
	'X'	=> 10,
	'IX'	=> 9,
	'V'	=> 5,
	'IV'	=> 4,
	'I'	=> 1
}
def roman_to_integer(rom)
  return 0 if rom.empty?
  key = $rom_to_int.each_key.find { |k| rom.start_with? k }
  return $rom_to_int[key] + roman_to_integer(rom.slice(key.length, rom.length))
end

# MERGE SORT
class Array
  def first_half
    return self.slice(0, self.length/2)
  end

  def last_half
    return self.slice(self.length/2, self.length - self.length/2)
  end
end

def merge(ara,arb)
  return arb if ara[0].nil?
  return ara if arb[0].nil?
  if ara[0] < arb[0]
    result = [] << ara.shift
  else
    result = [] << arb.shift
  end
  return (result << merge(ara,arb)).flatten
end

def merge_sort(ary)
  return ary if ary.length == 1
  merge(merge_sort(ary.first_half),merge_sort(ary.last_half))
end
