class Country < ApplicationRecord

  def get_articles
    articles = []
    get_sources(country.code).each do |source|
      uri = URI.parse("https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey="
        + ENV['NEWS_API_KEY'])

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)

      response = http.request(request)

      # if response.code == "200"
        result = JSON.parse(response.body)

        result['articles'].each do |article|
          articles < article
        end

        return articles
      # else
      #   puts "Whoops! API could not be reached."
      # end
    end
  end

  def get_sources(country_code)
    sources = []
    uri = URI.parse("https://newsapi.org/v1/sources?language=en&country=us"
      + country_code)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    # if response.code == "200"
      result = JSON.parse(response.body)

      result['sources'].each do |source|
        sources < source['id']
      end

      return sources
    # else
    #   return "Whoops! API could not be reached."
    # end
  end
end
