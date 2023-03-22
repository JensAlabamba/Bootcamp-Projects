# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length == 0 
        return nil 
    else
        return self.max - self.min
    end
  end

  def average
    if self.length == 0
        return nil
    else
    self.sum / (self.length / 1.0)
    end
  end

  def median
    if self.length == 0
        return nil
    end
    if  self.length.odd?
        return self.sort[(self.length / 2)] 
    else
        return (self.sort[self.length / 2] + self.sort[(self.length / 2) - 1]) / 2.0
    end
    end

    def counts
        count = Hash.new(0)
        self.each { |el| count[el] += 1 }
        return count
    end

    def my_count(ele)
        count = 0
        self.each do |el|
            if el == ele
            count += 1
            end
        end
        return count
    end

    def my_index(ele)   
        return nil if !self.include?(ele)

        self.each_with_index do |el, idx|
           if el == ele
            return idx
           end 
        end
    end

    def my_uniq
        uniqs = []
        self.each do |ele|
            if !uniqs.include?(ele)
                uniqs << ele
            end
        end
        return uniqs
    end

    def my_transpose
        result = Array.new(self.size) { Array.new(self.size) }
        self.each_with_index do |row, i|
          row.each_with_index do |elem, j|
            result[j][i] = elem
          end
        end
        result
      end
end

