require "spec_helper"

describe Hash do
  describe "#to_parslet" do
    context "if given Entity" do
      let(:hash) do
       {
          "atom" => "entity",
          "name" => "foo",
          "parslet" => {
            "atom" => "str",
            "str" => "foo"
          }
        }
      end

      it "should turn into an Entity" do
        expect(hash.to_parslet).to be_kind_of(Parslet::Atoms::Entity)
      end

      it "should set the name" do
        expect(hash.to_parslet.instance_variable_get("@name")).to eq("foo")
      end

      it "should set and convert the parslet" do
        expect(hash.to_parslet.instance_variable_get("@parslet")).to be_kind_of(Parslet::Atoms::Str)
      end
    end

    context "if given Named" do
      let(:hash) do
       {
          "atom" => "named",
          "name" => "foo",
          "parslet" => {
            "atom" => "str",
            "str" => "foo"
          }
        }
      end

      it "should turn into a Named" do
        expect(hash.to_parslet).to be_kind_of(Parslet::Atoms::Named)
      end

      it "should set the name" do
        expect(hash.to_parslet.instance_variable_get("@name")).to eq("foo")
      end

      it "should set and convert the parslet" do
        expect(hash.to_parslet.instance_variable_get("@parslet")).to be_kind_of(Parslet::Atoms::Str)
      end
    end

    context "if given Re" do
      let(:hash) do
       {
          "atom" => "re",
          "re" => /(?-mix:foo)/m,
          "match" => nil
        }
      end

      it "should turn into an Entity" do
        expect(hash.to_parslet).to be_kind_of(Parslet::Atoms::Re)
      end

      it "should set the name" do
        expect(hash.to_parslet.instance_variable_get("@re")).to eq(/(?-mix:foo)/m)
      end

      it "should set the match" do
        expect(hash.to_parslet.instance_variable_get("@match")).to eq("")
      end
    end

    context "if given Repetition" do
      let(:hash) do
       {
          "atom" => "repetition",
          "min" => 4,
          "max" => 5,
          "parslet" => {
            "atom" => "str",
            "str" => "foo"
          }
        }
      end

      it "should turn into an Entity" do
        expect(hash.to_parslet).to be_kind_of(Parslet::Atoms::Repetition)
      end

      it "should set the min" do
        expect(hash.to_parslet.instance_variable_get("@min")).to eq(4)
      end

      it "should set the max" do
        expect(hash.to_parslet.instance_variable_get("@max")).to eq(5)
      end

      it "should set and convert the parslet" do
        expect(hash.to_parslet.instance_variable_get("@parslet")).to be_kind_of(Parslet::Atoms::Str)
      end
    end

    context "if given Sequence" do
      let(:hash) do
       {
          "atom" => "sequence",
          "parslets" => [
            {
              "atom" => "str",
              "str" => "foo"
            },
            {
              "atom" => "str",
              "str" => "foo"
            }
          ]
        }
      end

      it "should turn into an Entity" do
        expect(hash.to_parslet).to be_kind_of(Parslet::Atoms::Sequence)
      end

      it "should set and convert the parslets" do
        expect(hash.to_parslet.instance_variable_get("@parslets").first).to be_kind_of(Parslet::Atoms::Str)
        expect(hash.to_parslet.instance_variable_get("@parslets").last).to be_kind_of(Parslet::Atoms::Str)
      end
    end

    context "if given Str" do
      let(:hash) do
        {
          "atom" => "str",
          "str" => "foo"
        }
      end

      it "should turn into an Entity" do
        expect(hash.to_parslet).to be_kind_of(Parslet::Atoms::Str)
      end

      it "should set the name" do
        expect(hash.to_parslet.instance_variable_get("@str")).to eq("foo")
      end
    end
  end
end
