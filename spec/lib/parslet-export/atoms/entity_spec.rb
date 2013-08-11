require "spec_helper"

describe Parslet::Atoms::Entity do
  describe "#to_hash" do
    let(:dump) do
      described_class.new("foo").tap do |entity|
        entity.instance_variable_set("@parslet", Parslet::Atoms::Str.new("foo"))
      end.to_hash
    end

    it "contains the name" do
      expect(dump["name"]).to eq("foo")
    end

    it "contains the dumped parslet" do
      expect(dump["parslet"]["atom"]).to eq("str")
    end
  end
end
