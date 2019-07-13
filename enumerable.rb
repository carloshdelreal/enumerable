module Enumerable
    def my_each
        if self.class == Range
            for i in self
                yield i
            end
        else
            i = 0 
            while i < self.count
                yield self[i]
                i += 1
            end
        end
    end
    def my_each_with_index
        i = 0 
        while i < self.count
            yield self[i], i
            i += 1
        end
    end
    def my_select
        selected = []
        self.my_each do | x |
            if yield( x )
                selected << x
            end
        end
        return selected
    end
    def my_all?
        self.my_each do | x |
            if !yield(x)
                return false
            end
        end
        return true
    end
    def my_any?
        self.my_each do | x |
            if yield(x)
                return true
            end
        end
        return false
    end
    def my_none?
        self.my_each do | x |
            if block_given?
                if yield(x)
                    return false
                end
            else
                if x
                    return false
                end
            end
        end
        return true
    end
    def my_count
        counter = 0
        self.my_each do | x |
            if block_given?
                if yield(x)
                    counter += 1
                end
            else
                counter += 1
            end
        end
        return counter
    end
    def my_map
    
        new_array = []
        self.my_each do | x |
            new_array << yield(x)
        end
        return new_array
    end
    def my_inject
        first = true
        sum = 0
        self.my_each do | n |
            if first
                sum = n
                first = false
            else
                sum = yield(sum , n)
            end
        end
        return sum
    end
end

a = [1,2,3,4,5]
b = [30,40,50,60]

##my_each
# puts "my_each"
# a.my_each { |x| print x; print " "}
# puts
# b.my_each { |x| print x; print " "}
# puts

##my_each_with_index
# puts
# puts "my_each_with_index"
# a.my_each_with_index { | x, i | print "Index: #{i} Value: #{x}"; print " \t"}
# puts
# b.my_each_with_index { | x, i | print "Index: #{i} Value: #{x}"; print " \t"}

##my_select
# puts
# puts "my_select"
# puts a.my_select { | num | num.even? }.to_s
# puts a.my_select { | x | x == 2}.to_s
# puts b.my_select { | num | num.even? }.to_s
# puts

##my_all?
# puts
# puts "my_all?"
# puts a.my_all? { | num | num.even? }.to_s
# puts a.my_all? { | x | x == 2}.to_s
# puts b.my_all? { | num | num.integer? }.to_s
# puts [nil, true, 99].any?.to_s
# puts [].any?.to_s
# puts [nil].any?.to_s
# puts

##my_any?
# puts
# puts "my_any?"
# puts a.my_any? { | num | num.even? }.to_s
# puts a.my_any? { | x | x == 2}.to_s
# puts b.my_any? { | num | num.negative? }.to_s
# puts

##my_none?
# puts
# puts "my_none?"
# puts a.my_none? { | num | num.even? }.to_s
# puts a.my_none? { | x | x == 2}.to_s
# puts b.my_none? { | num | num.negative? }.to_s
# puts [nil].my_none?.to_s
# puts [].my_none?.to_s
# puts [nil, false].my_none?.to_s
# puts

## my_count
# puts
# puts "my_count"
# puts a.my_count { | num | num.even? }
# puts a.my_count { | x | x == 2}
# puts b.my_count { | num | num.negative? }
# puts [nil].my_count
# puts [].my_count
# puts [nil, false].my_count
# puts

## my_map
pr = Proc.new { | i | i*i }

puts
puts "my_map"
puts a.my_map { | i | i*i }.to_s
puts a.my_map(&pr)
puts a.my_map { | i | i*2 }.to_s
puts a.my_map { | i | i**i }.to_s

puts

## my_inject
# def multiply_els(a)
#     a.my_inject{|sum, n| sum * n }
# end

# puts
# puts "my_inject"
# puts [5,6,7,8,9,10].my_inject { |sum, n| sum + n }
# puts multiply_els([2,4,5])
# puts (5..10).my_inject { |sum, n| sum * n }