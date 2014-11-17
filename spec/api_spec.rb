require 'printfection'

module Printfection
  describe API, "#get" do
    let(:client) { Object.new.extend(API) }

    it "returns the response data of a GET request" do
      response_data = double
      expect(client).to receive(:request).
                        with(:get, "/path/to/resource/123", {page: 5}).
                        and_return(response_data)
      expect(client.get("/path/to/resource/123", page: 5)).to eql response_data
    end
  end

  describe API, "#post" do
    let(:client) { Object.new.extend(API) }

    it "returns the response data of a POST request" do
      response_data = double
      expect(client).to receive(:request).
                        with(:post, "/path/to/resource/123", {page: 5}).
                        and_return(response_data)
      expect(client.post("/path/to/resource/123", page: 5)).to eql response_data
    end
  end

  describe API, "#patch" do
    let(:client) { Object.new.extend(API) }

    it "returns the response data of a PATCH request" do
      response_data = double
      expect(client).to receive(:request).
                        with(:patch, "/path/to/resource/123", {page: 5}).
                        and_return(response_data)
      expect(client.patch("/path/to/resource/123", page: 5)).to eql response_data
    end
  end

  describe API, "#delete" do
    let(:client) { Object.new.extend(API) }

    it "returns the response data of a DELETE request" do
      response_data = double
      expect(client).to receive(:request).
                        with(:delete, "/path/to/resource/123").
                        and_return(response_data)
      expect(client.delete("/path/to/resource/123")).to eql response_data
    end
  end

  describe API, "#request" do
    let(:client) { Object.new.extend(API) }

    context "when it is a GET request" do
      it "performs a get with the params" do
        expect(RestClient).to receive(:get).
                              with("https://api.printfection.com/v2/path/to/resource/123", {:params => {:page => 5}, :accept => :json}).
                              and_return(double(:body => "{}"))
        client.request(:get, "/path/to/resource/123", page: 5)
      end
    end

    context "when it is a POST request" do
      it "performs a post with the params" do
        expect(RestClient).to receive(:post).
                              with("https://api.printfection.com/v2/path/to/resource/123", {page: 5}.to_json, {:accept => :json, :content_type => :json}).
                              and_return(double(:body => "{}"))
        client.request(:post, "/path/to/resource/123", {page: 5})
      end
    end

    context "when it is a PATCH request" do
      it "performs a patch with the params" do
        expect(RestClient).to receive(:patch).
                              with("https://api.printfection.com/v2/path/to/resource/123", {page: 5}.to_json, {:accept => :json, :content_type => :json}).
                              and_return(double(:body => "{}"))
        client.request(:patch, "/path/to/resource/123", {page: 5})
      end
    end

    context "when it is a DELETE request" do
      it "performs a delete on the url" do
        expect(RestClient).to receive(:delete).
                              with("https://api.printfection.com/v2/path/to/resource/123").
                              and_return(double(:body => "{}"))
        client.request(:delete, "/path/to/resource/123")
      end
    end

    context "when it is an invalid http request verb" do
      it "raises an exception" do
        expect {
          client.request(:invalid_request_type, "/path/to/resource/123")
        }.to raise_error Error, "Unknown HTTP verb: 'invalid_request_type'"
      end
    end

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
          json = client.request(:get, "/path/to/resource/123", page: 5)
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
            client.request(:get, "/path/to/resource/123", page: 5)
          }.to raise_error Printfection::Error
        end
      end
    end

    context "when it is not successful" do
      context "when it is a known http status code" do
        it "raises an Error with the appropriate message" do
          response = double(:response, code: 400, body: '{"message":"Invalid or missing request parameters."}')
          allow(RestClient).to receive(:get).and_raise(RestClient::Exception.new(response))
          expect { client.request(:get, "/path/to/resource/123") }.to raise_error Printfection::Error, "Invalid or missing request parameters."

          response = double(:response, code: 401, body: '{"message":"Invalid API key provided."}')
          allow(RestClient).to receive(:get).and_raise(RestClient::Exception.new(response))
          expect { client.request(:get, "/path/to/resource/123") }.to raise_error Printfection::Error, "Invalid API key provided."

          response = double(:response, code: 404, body: '{"message":"Not Found."}')
          allow(RestClient).to receive(:get).and_raise(RestClient::Exception.new(response))
          expect { client.request(:get, "/path/to/resource/123") }.to raise_error Printfection::Error, "Not Found."
        end
      end

      context "when it is an unknown http status code" do
        it "raises an Error with a generic message" do
          allow(RestClient).to receive(:get).
            and_raise(RestClient::Exception)
          expect {
            client.request(:get, "/path/to/resource/123")
          }.to raise_error Printfection::Error, "Something went wrong with the request. Please try again."
        end
      end

      context "when an unknown exception is raised" do
        it "raises an Error with a generic message" do
          allow(RestClient).to receive(:get).
            and_raise(StandardError)
          expect {
            client.request(:get, "/path/to/resource/123")
          }.to raise_error Printfection::Error, "Something went wrong. Please try again."
        end
      end
    end
  end
end

