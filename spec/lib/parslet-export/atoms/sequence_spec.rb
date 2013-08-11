require "spec_helper"

describe Parslet::Atoms::Sequence do
  describe "#to_hash" do
    let(:atom) do
      described_class.new(Parslet::Atoms::Str.new("str"))
    end

    it "returns a Hash object" do
      expect(atom.to_hash).to be_kind_of(Hash)
    end

    it "contains a parslet" do
      expect(atom.to_hash["parslets"]).to be_kind_of(Array)
      expect(atom.to_hash["parslets"].first).to have_key("atom")
    end
  end
end
