class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def show_articles(url)
    uri = URI.parse(url)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)

    if response.code == "200"
      result = JSON.parse(response.body)

      result.each do |doc|
        puts doc["id"] #reference properties like this
        puts doc # this is the result in object form
        puts ""
        puts ""
      end
    else
      puts "Whoops! API could not be reached."
    end
  end
end
