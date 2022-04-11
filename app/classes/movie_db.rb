class MovieDb

  def self.parse_results(key, path, raw_results)
    results_with_fields = []
    raw_results[:results].each do |movie|
      movie_data = {
        id: movie[:id],
        url: "https://image.tmdb.org/t/p/w500#{movie[:poster_path]}",
        title: movie[:title],
        overview: movie[:overview]
      }
      results_with_fields << movie_data
    end
    return results_with_fields
  end

  def self.search_by_query(query, page, source="movie")
    path ="https://api.themoviedb.org/3"
    url = "#{path}/search/#{source}"
    key = "?api_key=a99cc60fc2b34dbb18cb806b8a88ed14"
    page = "&page=#{page}"
    full_query = "&query=#{query.encode('utf-8')}"
    full_url = url + key + page + full_query

    options={}

    begin
      raw_results =  HTTParty.get(full_url, options).parsed_response.deep_symbolize_keys
      parsed_results = self.parse_results(key, path, raw_results)
      return parsed_results
    rescue Exception => e
      # send it to a remote error handling platform to notify team
      return { error: true, message: e }
    end
  end

  def self.search_by_query_for_all_pages(query, source="movie")
    page = 1
    results = []

    page_results = self.search_by_query(query, page, source="movie")
    return page_results

  end


end
