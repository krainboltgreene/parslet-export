require "spec_helper"

describe Parslet::Atoms::Named do
  describe "#to_hash" do
    let(:atom) { described_class.new(Parslet::Atoms::Str.new("foo"), "foo") }

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
