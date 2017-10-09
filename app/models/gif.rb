class Gif
  attr_reader :embed_url, :url

  def initialize(data)
    @embed_url = data['embed_url']
    @url = data['url']
  end
end
