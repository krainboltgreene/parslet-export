require "spec_helper"

describe Parslet::Atoms::Named do
  describe "#to_hash" do
    let(:dump) { described_class.new(Parslet::Atoms::Str.new("foo"), "foo").to_hash }

    it "contains the name" do
      expect(dump["name"]).to eq("foo")
    end

    it "contains the dumped parslet" do
      expect(dump["parslet"]["atom"]).to eq("str")
    end
  end
end
