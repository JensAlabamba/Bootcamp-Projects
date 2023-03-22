def select_even_nums(arr)
 arr.select(&:even?)
end

def reject_puppies(hash)
  arr = hash.to_a
  arr.reject { |ele| ele["age"] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |subs| subs.sum > 0 }
end

def aba_translate(word)
    vowels = "aoeiu"
    new_word = ""
    word.each_char do |char|
    if vowels.include?(char)
        new_word += char + "b" + char
    else
        new_word += char
    end

    end
    new_word
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end