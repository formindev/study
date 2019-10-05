module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |item| max = item if max < item }
             .map { |item| item > 0 ? max : item }
      end

      def search(array, query)
        return -1 if array.empty?

        first = 0
        last = array.length - 1

        while first <= last

          middle = first + (last - first) / 2
          return middle if array[middle] == query

          if array[middle] < query
            first = middle + 1
          else last = middle - 1
          end
        end
        -1
      end
    end
  end
end
