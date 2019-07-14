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
    def my_count(arg = nil)
        counter = 0
        self.my_each do | x |
            if block_given?
                if yield(x)
                    counter += 1
                end
            elsif arg
                if x == arg
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
