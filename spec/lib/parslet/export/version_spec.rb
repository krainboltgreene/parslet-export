require "spec_helper"

describe Parslet::Export::VERSION do
  it "should be a string" do
    expect(Parslet::Export::VERSION).to be_kind_of(String)
  end
end
