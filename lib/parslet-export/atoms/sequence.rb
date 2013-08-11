module Parslet
  module Atoms
    class Sequence
      def to_hash
        {
          "atom" => "sequence",
          "parslets" => parslets.map(&:to_hash)
        }
      end
    end
  end
end
