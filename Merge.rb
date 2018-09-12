def merge_sort(arr)
    return *arr if arr.length<2
    arr1 = merge_sort(arr[0..(arr.length/2-1)])
    arr2 = merge_sort(arr[(arr.length/2)..-1])
    return merge(arr1,arr2)
end

def merge(arr1,arr2)
    i=0
    j=0
    merged = false
    merged_arr = []
    until merged
        if arr1[i]>arr2[j]
            merged_arr << arr2[j]
            j += 1
        else
            merged_arr << arr1[i]
            i += 1
        end
        merged = (i == arr1.length or j == arr2.length)
    end
    return (i == arr1.length) ? (merged_arr + arr2[j..-1]) : (merged_arr + arr1[i..-1])
end
puts merge_sort([5,4,3,2,1])
puts merge_sort([12,24,15,7,2])
puts merge_sort([5,6,8,3,9,4,0,1,2,7])
