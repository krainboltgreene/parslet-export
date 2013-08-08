module Parslet
  module Atoms
    class Repetition
      def to_hash
        {
          "atom" => "repetition",
          "min" => min,
          "max" => max,
          "parslet" => parslet.to_hash
        }
      end
    end
  end
end
