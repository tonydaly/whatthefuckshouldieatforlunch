class RootController < ApplicationController
  respond_to :json, :html

  def index
    @businesses = $yelp.find(category_filter: "restaurants", location: "london").businesses.shuffle
    respond_with(@businesses) do |format|
      format.html { @business = @businesses.first }
    end
  end
end