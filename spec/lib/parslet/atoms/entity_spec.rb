require "spec_helper"

describe Parslet::Atoms::Entity do
  describe "#to_hash" do
    let(:atom) do
      described_class.new("foo").tap do |entity|
        entity.instance_variable_set("@parslet", Parslet::Atoms::Str.new("foo"))
      end
    end

    it "returns a Hash object" do
      expect(atom.to_hash).to be_kind_of(Hash)
    end

    it "contains the name" do
      expect(atom.to_hash["name"]).to eq("foo")
    end

    it "contains the parslet" do
      expect(atom.to_hash["parslet"]).to be_kind_of(Hash)
      expect(atom.to_hash["parslet"]).to have_key("atom")
    end
  end
end
