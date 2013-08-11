module Parslet
  module Atoms
    class Re
      def to_hash
        {
          "atom" => "re",
          "match" => match,
          "re" => re
        }
      end
    end
  end
end
