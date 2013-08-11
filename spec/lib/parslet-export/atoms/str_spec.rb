require "spec_helper"

describe Parslet::Atoms::Str do
  describe "#to_hash" do
    let(:dump) { described_class.new("foo").to_hash }

    it "contains the str" do
      expect(dump["str"]).to eq("foo")
    end
  end
end
