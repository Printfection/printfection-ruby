require 'printfection'

describe Printfection, ".get" do
  context "when it is successful" do
    let(:raw_json)    { double(:raw_json) }
    let(:response)    { double(:response, :body => raw_json) }
    let(:parsed_json) { double(:parsed_json) }

    before do
      allow(RestClient).to receive(:get).
                           with("https://api.printfection.com/v2/path/to/resource/123", {:params => {:page => 5}, :accept => :json}).
                           and_return(response)
    end

    context "when it can be parsed" do
      before do
        allow(JSON).to receive(:parse).
                       with(raw_json).
                       and_return(parsed_json)
      end

      it "returns the parsed JSON" do
        json = Printfection.get("/path/to/resource/123", page: 5)
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
          Printfection.get("/path/to/resource/123", page: 5)
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

describe Printfection, ".post" do
  context "when it is successful" do
    let(:input_json)  { double(:input_json) }
    let(:input_data)  { double(:input_data, :to_json => input_json) }
    let(:raw_json)    { double(:raw_json) }
    let(:response)    { double(:response, :body => raw_json) }
    let(:parsed_json) { double(:parsed_json) }

    before do
      allow(RestClient).to receive(:post).
                           with("https://api.printfection.com/v2/path/to/resource/123", input_json, {:accept => :json, :content_type => :json}).
                           and_return(response)
    end

    context "when it can be parsed" do
      before do
        allow(JSON).to receive(:parse).
                       with(raw_json).
                       and_return(parsed_json)
      end

      it "returns the parsed JSON" do
        json = Printfection.post("/path/to/resource/123", input_data)
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
          Printfection.post("/path/to/resource/123", input_data)
        }.to raise_error Printfection::Error
      end
    end
  end

  context "when it is not successful" do
    it "raises Error" do
      allow(RestClient).to receive(:post).
                           and_raise(RestClient::ResourceNotFound)
      expect {
        Printfection.post("/path/to/resource/123", {})
      }.to raise_error Printfection::Error
    end
  end
end

describe Printfection, ".patch" do
  context "when it is successful" do
    let(:input_json)  { double(:input_json) }
    let(:input_data)  { double(:input_data, :to_json => input_json) }
    let(:raw_json)    { double(:raw_json) }
    let(:response)    { double(:response, :body => raw_json) }
    let(:parsed_json) { double(:parsed_json) }

    before do
      allow(RestClient).to receive(:patch).
                           with("https://api.printfection.com/v2/path/to/resource/123", input_json, {:accept => :json, :content_type => :json}).
                           and_return(response)
    end

    context "when it can be parsed" do
      before do
        allow(JSON).to receive(:parse).
                       with(raw_json).
                       and_return(parsed_json)
      end

      it "returns the parsed JSON" do
        json = Printfection.patch("/path/to/resource/123", input_data)
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
          Printfection.patch("/path/to/resource/123", input_data)
        }.to raise_error Printfection::Error
      end
    end
  end

  context "when it is not successful" do
    it "raises Error" do
      allow(RestClient).to receive(:patch).
                           and_raise(RestClient::ResourceNotFound)
      expect {
        Printfection.patch("/path/to/resource/123", {})
      }.to raise_error Printfection::Error
    end
  end
end

describe Printfection, ".delete" do
  context "when it is successful" do
    let(:raw_json)    { double(:raw_json) }
    let(:response)    { double(:response, :body => raw_json) }
    let(:parsed_json) { double(:parsed_json) }

    before do
      allow(RestClient).to receive(:delete).
                           with("https://api.printfection.com/v2/path/to/resource/123").
                           and_return(response)
    end

    context "when it can be parsed" do
      before do
        allow(JSON).to receive(:parse).
                       with(raw_json).
                       and_return(parsed_json)
      end

      it "returns the parsed JSON" do
        json = Printfection.delete("/path/to/resource/123")
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
          Printfection.delete("/path/to/resource/123")
        }.to raise_error Printfection::Error
      end
    end
  end

  context "when it is not successful" do
    it "raises Error" do
      allow(RestClient).to receive(:delete).
                           and_raise(RestClient::ResourceNotFound)
      expect {
        Printfection.delete("/path/to/resource/123")
      }.to raise_error Printfection::Error
    end
  end
end

