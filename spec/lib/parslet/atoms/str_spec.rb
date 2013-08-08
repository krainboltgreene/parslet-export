require "spec_helper"

describe Parslet::Atoms::Str do
  describe "#to_hash" do
    let(:atom) { described_class.new("foo") }
    it "returns a Hash object" do
      expect(atom.to_hash).to be_kind_of(Hash)
    end
  end
end
