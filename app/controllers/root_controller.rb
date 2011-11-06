class RootController < ApplicationController
  respond_to :json, :html

  def index
    @businesses = $yelp.find(category_filter: "restaurants", location: "london").businesses
    respond_with(@businesses)  
  end
end