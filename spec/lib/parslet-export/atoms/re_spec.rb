require "spec_helper"

describe Parslet::Atoms::Re do
  describe "#to_hash" do
    let(:atom) { described_class.new(/foo/) }
    it "returns a Hash object" do
      expect(atom.to_hash).to be_kind_of(Hash)
    end

    it "contains the formatted regular expression" do
      expect(atom.to_hash["re"]).to eq(/(?-mix:foo)/m)
    end
  end
end
