def insertion_sort(array)
  array.each_with_index do |value, index|
    j = index
    while j>0 && array[j-1] > array[j]
      temp = array[j]
      array[j] = array[j-1]
      array[j-1] = temp
      j-=1
    end
  end
  array
end

def bubble_sort(array)
  sorted = false
  until sorted == true
    sorted = true
    array.each_with_index do |value, index|
      if index+1 < array.length && array[index] > array[index+1]
        sorted = false
        temp = array[index]
        array[index] = array[index+1]
        array[index+1] = temp
      end
    end
  end
  array
end

def merge_sort(array)
  # if it is only one element in the list it is already sorted, return.
  return array if array.length == 1
  # divide the list recursively into two halves until it can no more be divided.
  half = array.length/2
  list_one = merge_sort(array.slice(0,half))
  list_two = merge_sort(array.slice(half, array.length))
  return merge(list_one, list_two)
end

def merge(array1, array2)
  result = []

  while array1.length > 0 && array2.length > 0
    if array1[0] > array2[0] || array1[0] == array2[0]
      result << array2[0]
      array2 = array2.slice(1,array2.length)
    else
      result << array1[0]
      array1 = array1.slice(1,array1.length)
    end
  end
  counter = 0
  while array1.length > 0
    result << array1[0]
    array1 = array1.slice(1,array1.length)
  end
  while array2.length > 0
    result << array2[0]
    array2 = array2.slice(1,array2.length)
  end
  return result
end



print insertion_sort([1,3,2,5,3,7,4,8,3,0,3,5,7,8])
puts
print bubble_sort([1,3,2,5,3,7,4,8,3,0,3,5,7,8])
puts
print merge_sort([1,3,2,5,3,7,4,8,3,0,3,5,7,8])
puts
