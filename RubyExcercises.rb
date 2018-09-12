def caesar_cipher(str,rep)
    lows = [*('a'..'z')]
    ups = [*('A'..'Z')]
    output = str.chars.map do |let|
        if lows.include?let or ups.include?let
            if lows.include?let
                ref = lows
            else
                ref = ups
            end
            ref[(ref.index(let)+rep)%26]
        else
            let
        end
    end
    output.join
end

def stock_picker(arr)
    buy = 0
    sell = 0
    maxProf = 0
    arr.length.times do |i|
        day1 = arr[i]
        arr[(i+1)..-1].length.times do |j|
            day2 = arr[i+j+1]
            prof = day2-day1
            if prof>maxProf
                maxProf = prof
                buy=i
                sell=i+j+1
            end
        end
    end
    [buy,sell]
end
def in_string(sub, par)
    count = 0
    par.chars.length.times do |i|
        matched = true
        sub.chars.length.times do |j|
            if par[i+j]!=sub[j]
                matched = false
                break
            end
        end
        if matched
            count += 1
        end
    end
    count
end

def substrings(str, dictionary)
    str.downcase!
    output = {}
    dictionary.each do |sub|
        count = in_string(sub,str)
        output[sub] = count if count>0
    end
    output
end

def bubble_sort(arr)
    unsorted = true
    while unsorted
        unsorted = false
        arr.length.times do |i|
            if arr[i+1]!= nil and arr[i+1]-arr[i]<0
                temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp
                unsorted = true
            end
        end
    end
    arr
end

def bubble_sort_by(arr)
    unsorted = true
    while unsorted
        unsorted = false
        arr.length.times do |i|
            if arr[i+1]!= nil and yield(arr[i], arr[i+1])>0
                temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp
                unsorted = true
            end
        end
    end
    arr
end

def my_each(arr)
    arr.length.times do |i|
        yield arr[i]
    end
end

def my_each_with_index(arr)
    arr.length.times do |i|
        yield arr[i],i
    end
end

def my_select(arr)
    out = []
    my_each(arr) do |item|
        out << item if yield(item)
    end
    out
end

def my_all(arr)
    all = true
    my_each(arr) do |item|
        all = false unless yield(item)
    end
    all
end

def my_any(arr)
    any = false
    my_each(arr) do |item|
        any = true if yield(item)
    end
    any
end

def my_none(arr)
    none = true
    my_each(arr) do |item|
        none = false if yield(item)
    end
    none
end

def my_count(arr)
    count = 0
    my_each(arr) do |item|
        count += 1 if yield(item)
    end
    count
end

def my_map(arr,proc=nil)
    arr.length.times do |i|
        arr[i] = (proc == nil) ? yield(arr[i]) : proc.call(arr[i])
    end
    arr
end

def my_inject(arr)
    arr.length.times do |i|
        arr[i] = yield(arr[i-1],arr[i]) if i>0
    end
    arr[-1]
end

def multiply_els(arr)
    my_inject(arr) { |product, n| product * n }
end
