class RootController < ApplicationController
  respond_to :json

  def index
    respond_with(@businesses)  
  end
end