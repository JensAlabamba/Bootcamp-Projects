def all_words_capitalized?(arr)
 arr.all? { |word| capitalized?(word)}
end

def capitalized?(word)
  word == word.capitalize
end

def no_valid_url?(urls)
    invalid_extensions = ['.com', '.net', '.io', '.org']
    urls.none? { |url| invalid_extensions.any? { |ext| url.end_with?(ext) } }
end
  
def any_passing_students?(students)
    students.any? { |student| student[:grades].sum / student[:grades].length.to_f >= 75 }
  end
  