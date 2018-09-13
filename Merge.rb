def merge_sort(arr)

    #We have reached single element arrays, by definition sorted.
    return arr if arr.length<2

    #Sort the left, sort the right, merge, then return the result
    arr1 = merge_sort(arr[0..(arr.length/2-1)])
    arr2 = merge_sort(arr[(arr.length/2)..-1])
    return merge(arr1,arr2)
end

def merge(arr1,arr2)

    #Initialize indexes, flag, and output
    i=0
    j=0
    merged = false
    merged_arr = []

    #Until 1 list runs out of elements
    until merged

        #If the left list's first available element is smaller,
        #increment the left index and append the left element to the output list
        if arr1[i]>arr2[j]
            merged_arr << arr2[j]
            j += 1

        #Otherwise do the inverse
        else
            merged_arr << arr1[i]
            i += 1
        end

        #If the pointer has gone over the available elements for either list, exit loop
        merged = (i == arr1.length or j == arr2.length)
    end

    #Return the merged output + the rest of the remaining list
    return (i == arr1.length) ? (merged_arr + arr2[j..-1]) : (merged_arr + arr1[i..-1])
end

#Tests
puts merge_sort([5,4,3,2,1])
puts merge_sort([12,24,15,7,2])
puts merge_sort([5,6,8,3,9,4,0,1,2,7])
