class Api::V1::MoviesController < Api::V1::ApiApplicationController

  def search_by_query
    query = params[:query]
    source = params[:source]

    error = false
    if !query
      error = true
      message = "You must enter query text"
    end
    if false # add query check here to make sure query can be encoded
      error = true
      message = "Your query cannot have any special characters"
    end

    error, results = MovieDb.search_by_query_for_all_pages(query, source="movie")
    if !error && results
      render json: { data: results }, status: 200
    else
      render json: { error: true, error: error, message: "no results could be found" }, status: 200
    end
  end


end
