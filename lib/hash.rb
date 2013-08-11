class Hash
  def to_parslet
    case fetch("atom")
      when "entity"
        Parslet::Atoms::Entity.new(fetch("name")).tap do |atom|
          atom.instance_variable_set("@parslet", fetch("parslet").to_parslet)
        end
      when "named"
        Parslet::Atoms::Named.new(fetch("parslet").to_parslet, fetch("name"))
      when "repetition"
        Parslet::Atoms::Repetition.new(fetch("parslet").to_parslet, fetch("min"), fetch("max"))
      when "sequence"
        Parslet::Atoms::Sequence.new(*fetch("parslets").map(&:to_parslet))
      when "re"
        Parslet::Atoms::Re.new(fetch("match")).tap do |atom|
          atom.instance_variable_set("@re", fetch("re"))
        end
      when "str"
        Parslet::Atoms::Str.new(fetch("str"))
    end
  end
end
