require "spec_helper"

describe Parslet::Atoms::Sequence do
  describe "#to_hash" do
    let(:dump) do
      described_class.new(Parslet::Atoms::Str.new("str")).to_hash
    end

    it "contains at least one parslet" do
      expect(dump["parslets"].first["atom"]).to eq("str")
    end
  end
end
