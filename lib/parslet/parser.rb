module Parslet
  class Parser
    # This turns a Parslet::Parser into a Hash
    def to_hash
      {
        "atom" => "root",
        "parslet" => root.to_hash
      }
    end

    # This turns a Hash into a Parslet::Parser
    def self.from_hash(hash)
      new.tap do |parser|
        # Parsers have to have a #root method
        parser.define_singleton_method(hash["atom"]) do
          hash["parslet"].to_parslet
        end
      end
    end
  end
end
