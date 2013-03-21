module ApiQueryHelper
  
  def get_search_result
    keyword = params[:keyword]
    url = ''
    if params[:search_type] == 'twitter'
      url = URI.parse("http://search.twitter.com/search.json?q=#{keyword}")
    elsif params[:search_type] == 'reddit'
      url = URI.parse("http://www.reddit.com/search.json?q=#{keyword}")
    end
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req) 
          }
     return res.body
  end
  
end
