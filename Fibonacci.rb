def fibs1(reps)
    output = [1,1]
    (reps-2).times do |i|
        output << output[i]+output[i+1]
    end
    output
end

def fibs(reps, arr=[1,1])
    return arr if reps<=2; fibs(reps-1,arr << arr[-2]+arr[-1])
end

puts fibs(10)
