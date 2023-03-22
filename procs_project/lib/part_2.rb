def reverser(str, &prc)

    reversed = str.reverse!
    return prc.call(reversed)
    
end

def word_changer(sent, &prc)
    new_sent = []

    sent.split(" ").each { |word| new_sent << prc.call(word) }

    return new_sent.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    if prc_1.call(num) > prc_2.call(num)
        return prc_1.call(num)
    else
        return prc_2.call(num) 
    end
end

def and_selector(arr, prc1, prc2)
    new_arr = []

    arr.each do |ele|
    if prc1.call(ele) == true && prc2.call(ele) == true
        new_arr << ele
        end
    end
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |ele, i|
        if i.even?  
            new_arr << prc1.call(ele)
        else
            new_arr << prc2.call(ele)
        end
    end
    new_arr
end