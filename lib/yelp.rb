require 'rubygems'
require 'oauth'
require 'uri'
require 'json'

module Yelp
  class Request
    API_HOST = 'api.yelp.com'

    def initialize(consumer_key='', consumer_secret='', token='', token_secret='')
      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{API_HOST}"})
      @access_token = OAuth::AccessToken.new(consumer, token, token_secret)    
    end

    def find(options={})
      options = options.collect do |key, value|
        "#{key}=#{value}"
      end.join("&")

      path = URI.escape "/v2/search?#{options}"
      response = Yelp::Response.new @access_token.get(path).body
    end
  end

  class Response
    attr_accessor :region, :total, :businesses

    def initialize(body)
      body = JSON.parse body

      @region = body["region"]
      @total  = body["total"]
      @businesses = body["businesses"].collect do |business|
        Yelp::Business.new(business["name"], business["url"])
      end
    end
  end

  class Business
    attr_accessor :name, :url

    def initialize(name, url)
       @name = name
       @url = url
    end
  end
end