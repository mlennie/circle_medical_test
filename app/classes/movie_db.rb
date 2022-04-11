class MovieDb

  def self.search_by_query(query, source="movie")
    url = "https://api.themoviedb.org/3/search/#{source}"
    key = "?api_key=a99cc60fc2b34dbb18cb806b8a88ed14"
    full_query = "&query=#{query.encode('utf-8')}"
    full_url = url + key + full_query

    options={}

    begin
      return HTTParty.get(full_url, options).parsed_response.deep_symbolize_keys
    rescue WException => e
      # send it to a remote error handling platform to notify team
      return { error: true, message: e }
    end
  end

end
