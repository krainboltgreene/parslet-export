require "spec_helper"

describe Parslet::Atoms::Repetition do
  describe "#to_hash" do
    let(:atom) { described_class.new(Parslet::Atoms::Str.new("foo"), 1, 2) }

    it "returns a Hash object" do
      expect(atom.to_hash).to be_kind_of(Hash)
    end

    it "should contain the min" do
      expect(atom.to_hash["min"]).to eq(1)
    end

    it "should contain the max" do
      expect(atom.to_hash["max"]).to eq(2)
    end

    it "should contain the parslet" do
      expect(atom.to_hash["parslet"]).to be_kind_of(Hash)
      expect(atom.to_hash["parslet"]).to have_key("atom")
    end
  end
end
