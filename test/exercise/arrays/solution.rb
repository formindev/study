module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0;
        array.each { |item| if ( max < item ) then max = item end }
             .map { |item| item > 0 ? max : item }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
