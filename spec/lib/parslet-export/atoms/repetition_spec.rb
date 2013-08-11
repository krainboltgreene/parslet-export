require "spec_helper"

describe Parslet::Atoms::Repetition do
  describe "#to_hash" do
    let(:dump) { described_class.new(Parslet::Atoms::Str.new("foo"), 1, 2).to_hash }

    it "should contain the min" do
      expect(dump["min"]).to eq(1)
    end

    it "should contain the max" do
      expect(dump["max"]).to eq(2)
    end

    it "should contain a dumped parslet" do
      expect(dump["parslet"]["atom"]).to eq("str")
    end
  end
end
