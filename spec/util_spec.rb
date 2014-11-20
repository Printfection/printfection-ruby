require 'printfection'

module Printfection
  describe Util, ".join_uri" do
    it "returns a joined, normalized URI of all of the arguments" do
      uri = Util.join_uri("/manufacturers/123/", "/widgets/", "/456/")
      expect(uri).to eql "/manufacturers/123/widgets/456"
    end
  end
end

