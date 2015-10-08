def first_anagram(string)
  return string if string.length == 2 && string == string.reverse
  result = []
  return (result + [string, string.reverse]) if string.length == 2

  string_arr = string.split("")

  (0...string.length).each do |i|
    first_letter = string_arr[i]
    string_arr_copy = string_arr.dup
    string_arr_copy.delete_at(i)
    shorter_string = string_arr_copy.join("")
    poss_ends = first_anagram(shorter_string)

    result << poss_ends.map{ |el| first_letter + el }
    # result.map { |el| first_letter + el }
  end


  result.flatten
end

p first_anagram("abc")
