class ApiQueryController < ApplicationController
  
  def create
    hash = get_search_result
    @result = hash['results']
    
    render 'new'
  end
  
end
