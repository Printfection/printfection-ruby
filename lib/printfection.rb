require "ostruct"
require "rest_client"

require "printfection/version"
require "printfection/util"
require "printfection/resource"
require "printfection/actions"
require "printfection/product"
require "printfection/size"
require "printfection/image"
require "printfection/item"
require "printfection/campaign"
require "printfection/order"
require "printfection/line_item"
require "printfection/manifest"

module Printfection
  class Error < StandardError
  end

  def self.get(url="/")
    begin
      base_url = "https://api.printfection.com/v2/"
      url = [base_url.chomp("/"), url.chomp("/").reverse.chomp("/").reverse].join("/")
      response = RestClient.get(url, :accept => :json)
      body = response.body
      json = JSON.parse(response.body)
      return json

      # At this point, some exception has been raised either
      # during the request or parsing the response.
      #
      # We determine the type of error, and re-raise
      # our own error from the message in the response body.
    rescue RestClient::Exception => e
      # We likely got a http status code outside the 200-399 range.
      # If this is a GET or DELETE request, it is likely the resource is not owned by the client.
      # If this is a POST, PUT, or PATCH, the data might be invalid.

      # Handle 400, 401, and 404 errors.
      case e.http_code
      when 400 # Bad Request  - Invalid or missing request parameters.
      when 401 # Unauthorized - Invalid API key provided.
      when 404 # Not Found    - The requested item doesn't exist or the client doesn't own it.
        raise Error, JSON.parse(e.response.body)["message"]
      end

      # Handle any other http error (i.e. 5xx+), or other RestClient exceptions.
      # Re-raise a generic error.
      raise Error, "Something went wrong with the request. Please try again."
    rescue JSON::ParserError => e
      # We received the data fine, but we're unable to parse it.
      # Re-raise a generic error.
      raise Error, "Something went wrong parsing the response. Please try again."
    rescue StandardError => e
      # Something else went wrong.
      # Re-raise a generic error.
      raise Error, "Something went wrong. Please try again."
    end
  end

  def self.post(url, data={})
    begin
      base_url = "https://api.printfection.com/v2/"
      url = [base_url.chomp("/"), url.chomp("/").reverse.chomp("/").reverse].join("/")
      response = RestClient.post(url, data.to_json, :accept => :json, :content_type => :json)
      body = response.body
      json = JSON.parse(response.body)
      return json

      # At this point, some exception has been raised either
      # during the request or parsing the response.
      #
      # We determine the type of error, and re-raise
      # our own error from the message in the response body.
    rescue RestClient::Exception => e
      # We likely got a http status code outside the 200-399 range.
      # If this is a GET or DELETE request, it is likely the resource is not owned by the client.
      # If this is a POST, PUT, or PATCH, the data might be invalid.

      # Handle 400, 401, and 404 errors.
      case e.http_code
      when 400 # Bad Request  - Invalid or missing request parameters.
      when 401 # Unauthorized - Invalid API key provided.
      when 404 # Not Found    - The requested item doesn't exist or the client doesn't own it.
        raise Error, JSON.parse(e.response.body)["message"]
      end

      # Handle any other http error (i.e. 5xx+), or other RestClient exceptions.
      # Re-raise a generic error.
      raise Error, "Something went wrong with the request. Please try again."
    rescue JSON::ParserError => e
      # We received the data fine, but we're unable to parse it.
      # Re-raise a generic error.
      raise Error, "Something went wrong parsing the response. Please try again."
    rescue StandardError => e
      # Something else went wrong.
      # Re-raise a generic error.
      raise Error, "Something went wrong. Please try again."
    end
  end

  def self.patch(url, data={})
    begin
      base_url = "https://api.printfection.com/v2/"
      url = [base_url.chomp("/"), url.chomp("/").reverse.chomp("/").reverse].join("/")
      response = RestClient.patch(url, data.to_json, :accept => :json, :content_type => :json)
      body = response.body
      json = JSON.parse(response.body)
      return json

      # At this point, some exception has been raised either
      # during the request or parsing the response.
      #
      # We determine the type of error, and re-raise
      # our own error from the message in the response body.
    rescue RestClient::Exception => e
      # We likely got a http status code outside the 200-399 range.
      # If this is a GET or DELETE request, it is likely the resource is not owned by the client.
      # If this is a POST, PUT, or PATCH, the data might be invalid.

      # Handle 400, 401, and 404 errors.
      case e.http_code
      when 400 # Bad Request  - Invalid or missing request parameters.
      when 401 # Unauthorized - Invalid API key provided.
      when 404 # Not Found    - The requested item doesn't exist or the client doesn't own it.
        raise Error, JSON.parse(e.response.body)["message"]
      end

      # Handle any other http error (i.e. 5xx+), or other RestClient exceptions.
      # Re-raise a generic error.
      raise Error, "Something went wrong with the request. Please try again."
    rescue JSON::ParserError => e
      # We received the data fine, but we're unable to parse it.
      # Re-raise a generic error.
      raise Error, "Something went wrong parsing the response. Please try again."
    rescue StandardError => e
      # Something else went wrong.
      # Re-raise a generic error.
      raise Error, "Something went wrong. Please try again."
    end
  end

  def self.delete(url)
    begin
      base_url = "https://api.printfection.com/v2/"
      url = [base_url.chomp("/"), url.chomp("/").reverse.chomp("/").reverse].join("/")
      response = RestClient.delete(url)
      body = response.body
      json = JSON.parse(response.body)
      return json

      # At this point, some exception has been raised either
      # during the request or parsing the response.
      #
      # We determine the type of error, and re-raise
      # our own error from the message in the response body.
    rescue RestClient::Exception => e
      # We likely got a http status code outside the 200-399 range.
      # If this is a GET or DELETE request, it is likely the resource is not owned by the client.
      # If this is a POST, PUT, or PATCH, the data might be invalid.

      # Handle 400, 401, and 404 errors.
      case e.http_code
      when 400 # Bad Request  - Invalid or missing request parameters.
      when 401 # Unauthorized - Invalid API key provided.
      when 404 # Not Found    - The requested item doesn't exist or the client doesn't own it.
        raise Error, JSON.parse(e.response.body)["message"]
      end

      # Handle any other http error (i.e. 5xx+), or other RestClient exceptions.
      # Re-raise a generic error.
      raise Error, "Something went wrong with the request. Please try again."
    rescue JSON::ParserError => e
      # We received the data fine, but we're unable to parse it.
      # Re-raise a generic error.
      raise Error, "Something went wrong parsing the response. Please try again."
    rescue StandardError => e
      # Something else went wrong.
      # Re-raise a generic error.
      raise Error, "Something went wrong. Please try again."
    end
  end
end

