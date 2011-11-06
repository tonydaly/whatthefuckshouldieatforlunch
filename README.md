# Introduction

To use create an initializer like the following:

```ruby
require 'yelp'

$yelp = Yelp::Request.new(
  consumer_key,
  consumer_secret,
  token,
  token_secret)
```

You can obtain your own details by signing up for a developer account with Yelp: http://www.yelp.com/developers/getting_started/api_overview

# Inspired

This was inspired by [What The Fuck Should I Make For Dinner?](http://whatthefuckshouldimakefordinner.com)