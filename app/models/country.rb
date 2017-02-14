class Country < ApplicationRecord

  def get_articles(country_code)
    articles = []

    get_sources(country_code).each do |source|
      url = ("https://newsapi.org/v1/articles?source=" + source + "&apiKey=" + ENV['NEWS_API_KEY'])
      result = parse_data(url)

      result['articles'].each do |article|
        articles << article
      end

      return articles
    end
  end

  def get_sources(country_code)
    sources = []
    url = ("https://newsapi.org/v1/sources?language=en&country=" + country_code)
    result = parse_data(url)

    result['sources'].each do |source|
      sources << source['id']
    end

    return sources
  end

  def parse_data(url)
    uri = URI.parse(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    return JSON.parse(response.body)
  end
end
