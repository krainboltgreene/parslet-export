require "spec_helper"

describe Parslet::Parser do
  describe "to_hash" do
    let(:parser) do
      described_class.new.tap do |parser|
        parser.define_singleton_method(:root) do
          Parslet::Atoms::Str.new("foo")
        end
      end
    end

    it "should return the root object as a Hash" do
      expect(parser.to_hash).to be_kind_of(Hash)
      expect(parser.to_hash["atom"]).to eq("root")
      expect(parser.to_hash["parslet"]).to eq({ "atom" => "str", "str" => "foo" })
    end
  end

  describe ".from_hash" do
    let(:hash) do
      {
        "atom" => "root",
        "parslet" => {
          "atom" => "str",
          "str" => "foo"
        }
      }
    end
    let(:parser) { Parslet::Parser.from_hash(hash) }

    it "should return a Parslet::Parser" do
      expect(parser).to be_kind_of(Parslet::Parser)
    end

    it "should have a root" do
      expect(parser).to be_respond_to(:root)
    end

    it "should return a root with the right atom" do
      expect(parser.root).to be_kind_of(Parslet::Atoms::Str)
    end
  end
end
