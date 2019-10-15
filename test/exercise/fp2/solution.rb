module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in 0..length - 1 do
          yield self[i]
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        return_array = MyArray.new
        my_each { |item| return_array << yield(item) }
        return_array
      end

      # Написать свою функцию my_compact
      def my_compact
        return_array = MyArray.new
        my_map { |item| return_array << item unless item.nil? }
        return_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |item| acc.nil? ? acc = self[0] : acc = yield(acc, item) }
        acc
      end
    end
  end
end
