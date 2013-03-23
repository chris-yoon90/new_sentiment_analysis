module ApiQueryHelper
  
  def get_search_result
    keyword = params[:keyword]
    url = ''
    if params[:search_type] == 'twitter'
      url = URI.parse("http://search.twitter.com/search.json?q=#{keyword}&lang=en")
    elsif params[:search_type] == 'reddit'
      url = URI.parse("http://www.reddit.com/search.json?q=#{keyword}")
    end
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req) 
          }
     JSON.parse(res.body)
  end
  
  def get_sentiment(text)
    sentiment_url = URI.parse('http://text-processing.com/api/sentiment/')
    data = {'text' => text}
    JSON.parse(Net::HTTP.post_form(sentiment_url, data).body)
  end
  
end
