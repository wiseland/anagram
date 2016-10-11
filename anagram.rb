# Use hash to determine anagrams
def anagram(str1, str2)
  st1 = format_str(str1)
  st2 = format_str(str2)
  if st1.size != st2.size
    return false 
  end
  
  h1 = split_str(st1)
  h2 = split_str(st2)

  h1.each_pair do |k,v|
    if h2[k]
      h2[k] -= h1[k]
    else
      return false
    end
  end
  
  return h2.to_a.all?{ |c| c[1].zero? }
end

# Format string
def format_str(str)
  str_tmp = str.downcase
  str_tmp = str_tmp.gsub(/[^a-zA-Z]/, '')
end

# Create a hash from string
def split_str(str)
  Hash.new.tap do |hash|
    str.split('').each do |ch|
      hash[ch] = hash[ch] ? hash[ch] + 1 : 1   
    end
  end
end

# Tests

puts '--- TRUE CASES ---'
puts anagram('a', 'a')
puts anagram('ab', 'ba')
puts anagram('ab, sd', 'ba sd')
puts anagram('Ab', 'Ba')
puts anagram("   \t\r\nab    \n", 'ab')
puts anagram('', '')


puts '--- FALSE CASES ---'
puts anagram('ab', 'bb')
puts anagram('ab', 'abc')
puts anagram('abc', 'a')
