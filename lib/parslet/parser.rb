module Parslet
  class Parser
    def to_hash
      {
        "atom" => "root",
        "parslet" => root.to_hash
      }
    end

    def self.from_hash(hash)
      new.tap do |parser|
        parser.define_singleton_method(hash["atom"]) do
          hash["parslet"].to_parslet
        end
      end
    end
  end
end
