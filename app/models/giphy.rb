class Giphy
  include HTTParty

  base_uri 'api.giphy.com'

  def initialize
    @options = { query: { api_key: ENV['GIPHY_API_KEY'], rating: 'g', limit: 10 } }
  end

  def search(query)
    data = self.class.get("/v1/gifs/search?q=#{query}", @options).parsed_response['data']
    data.map do |gif|
      Gif.new(gif)
    end
  end
end
