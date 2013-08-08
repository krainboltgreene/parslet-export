module Parslet
  module Atoms
    class Entity
      def to_hash
        {
          "atom" => "entity",
          "name" => name,
          "parslet" => parslet.to_hash
        }
      end
    end
  end
end
