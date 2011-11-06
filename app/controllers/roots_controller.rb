class RootsController < ApplicationController
  respond_to :json, :html

  def index
    @businesses = $yelp.find(category_filter: "restaurants", location: "london").businesses.shuffle
    respond_with(@businesses)
  end

  def create
    response = $yelp.find(
      category_filter: "restaurants", 
      ll: params.values.join(','))

    respond_with(response.businesses.shuffle, location: nil)
  end
end