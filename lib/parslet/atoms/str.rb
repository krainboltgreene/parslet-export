module Parslet
  module Atoms
    class Str
      def to_hash
        {
          "atom" => "str",
          "str" => str
        }
      end
    end
  end
end
