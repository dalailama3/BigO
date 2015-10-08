#bad_two_sum (brute force) time complexity = O(n * (n-1/2)) => O(n**2)

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el, idx|
    (idx+1...arr.length).each do |idx2|
      return true if (arr[idx] + arr[idx2]) == target_sum
    end
  end

  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#okay_two_sum time complexity = O((n-upper_bound)**2 + (n-upper_bound)/2) => O(n**2)
def okay_two_sum?(arr, target_sum)
  arr.sort!
  upper_bound = arr.length
  arr.each_with_index do |el, idx|
    upper_bound = idx if el >= target_sum
  end

  (0...upper_bound).each do |idx|
    (idx+1...upper_bound).each do |idx2|
      return true if arr[idx] +  arr[idx2] == target_sum
    end
  end

  false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

#hash_two_sum time complexity = O(n)
def hash_two_sum(array, target)
  values = Hash.new(0)
  array.each do |num|
    diff = target - num
    return true if values[diff] != 0
    values[num] = num
  end
  false
end


arr = [0, 1, 5, 7]
p hash_two_sum(arr, 6) # => should be true
p hash_two_sum(arr, 10) # => should be false
