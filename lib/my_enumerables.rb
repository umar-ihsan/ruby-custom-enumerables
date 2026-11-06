module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    
    return to_enum(:my_each) unless block_given?
    for item in self
       yield(item)
    end
  
  
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    index = 0
    for item in self
      yield(item,index)
      index +=1
    end

  end


  def my_inject(initial_value)

    for item in self
      initial_value = yield(initial_value,item)
    end
    initial_value
  end

  def my_all?

    return to_enum(:my_all) unless block_given?

    
    for item in self
      return false unless yield(item)
    end
    true
  end


  def my_any?
    return to_enum(:my_any) unless block_given?

    for item in self
      return true if yield(item)
    end
    false
  end


  def my_count
    return self.length unless block_given?

    count = 0
    for item in self
      count +=1 if yield(item)
    end
    count
  end

  def my_map
    return self.to_enum unless block_given?

      array = []
      for item in self
        array << yield(item)
      end

    array
  end

  def my_none?

    for item in self
      return false if yield(item)
    end
    true
  end

  def my_select
    return self.to_enum unless block_given?

    array = []

    for item in self

      array << item if yield(item)

    end

    array
  end

end
