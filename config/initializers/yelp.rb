require 'yelp'

$yelp = Yelp::Request.new(
  ENV['YELP_CONSUMER_KEY'],
  ENV['YELP_CONSUMER_SECRET'],
  ENV['YELP_TOKEN'],
  ENV['YELP_TOKEN_SECRET'])
  