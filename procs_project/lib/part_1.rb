def my_map(arr, &prc)
new_arr = []

arr.each { |ele| new_arr << prc.call(ele) }

new_arr
end

def my_select(arr, &prc)
    new_arr = []

    arr.each do |ele| 
        if prc.call(ele) == true
            new_arr << ele

        end
    end
    new_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each do |ele|
        if prc.call(ele) == true
            count += 1
        end
    end
    count
end

def my_any?(arr, &prc)
   
    if arr.all? { |ele| prc.call(ele) == false }
   return false
    end
    return true

end

def my_all?(arr, &prc)
    if arr.any? { |ele| prc.call(ele) == false }
    return false
    end
    return true
end

def my_none?(arr, &prc)

    if arr.any? { |ele| prc.call(ele) == true }
    return false
    end
    return true

end