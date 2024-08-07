def substrings(string, dictionary)
  chars_in_string = dictionary.filter_map do |word|
    word_in_string = string.downcase.include?(word)
    word if word_in_string
  end
  strings_hash = {}
  chars_in_string.each do |chars|
    strings_hash[chars] = string.downcase.scan(chars).count
  end
  strings_hash
end