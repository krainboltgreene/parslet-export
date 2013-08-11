module Parslet
  module Atoms
    class Named
      def to_hash
        {
          "atom" => "named",
          "name" => name,
          "parslet" => parslet.to_hash
        }
      end
    end
  end
end
