class RootsController < ApplicationController
  respond_to :json, :html

  def index
  end

  def create
    response = $yelp.find(
      category_filter: "restaurants", 
      ll: params.values.join(','))

    respond_with(response.businesses.shuffle, location: nil, status: 200)
  end
end