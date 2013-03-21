class ApiQueryController < ApplicationController
  
  def create
   
    @result = get_search_result
    
    render 'new'
  end
  
end
