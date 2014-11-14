require 'printfection'

describe Printfection, ".get" do
  context "when it is successful" do
    let(:raw_json)    { double(:raw_json) }
    let(:response)    { double(:response, :body => raw_json) }
    let(:parsed_json) { double(:parsed_json) }

    before do
      allow(RestClient).to receive(:get).
                           with("https://api.printfection.com/v2/path/to/resource/123", {:accept => :json}).
                           and_return(response)
    end

    context "when it can be parsed" do
      before do
        allow(JSON).to receive(:parse).
                       with(raw_json).
                       and_return(parsed_json)
      end

      it "returns the parsed JSON" do
        json = Printfection.get("/path/to/resource/123")
        expect(json).to eql parsed_json
      end
    end

    context "when it cannot be parsed" do
      before do
        allow(JSON).to receive(:parse).
                       with(raw_json).
                       and_raise(JSON::ParserError)
      end

      it "raises Error" do
        expect {
          Printfection.get("/path/to/resource/123")
        }.to raise_error Printfection::Error
      end
    end
  end

  context "when it is not successful" do
    it "raises Error" do
      allow(RestClient).to receive(:get).
                           and_raise(RestClient::ResourceNotFound)
      expect {
        Printfection.get("/path/to/resource/123")
      }.to raise_error Printfection::Error
    end
  end
end

