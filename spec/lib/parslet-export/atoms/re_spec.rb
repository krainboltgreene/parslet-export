require "spec_helper"

describe Parslet::Atoms::Re do
  describe "#to_hash" do
    let(:dump) { described_class.new(/foo/).to_hash }


    it "contains the formatted regular expression" do
      expect(dump["re"]).to eq(/(?-mix:foo)/m)
    end
  end
end
