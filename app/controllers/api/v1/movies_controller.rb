class Api::V1::MoviesController < Api::V1::ApiApplicationController

  def search_by_query
    query = params[:query]
    source = params[:source]

    error = false
    if !query
      error = true
      message = "You must enter query text"
    end
    results = MovieDb.search_by_query_for_all_pages(query, source="movie")
    if !error && results
      render json: { data: results }, status: 200
    else
      render json: { error: true, data: [], message: "no results could be found" }, status: 200
    end
  end


end
