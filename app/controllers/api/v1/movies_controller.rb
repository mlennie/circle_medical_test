class Api::V1::MoviesController < Api::V1::ApiApplicationController

  def search_by_query
    query = params[:query]
    source = params[:source]

    results = []
    error = false
    status = 200

    if !query
      error = true
      status = 400
      message = "You must enter query text"
    elsif false # add regex query check here to make sure query can be encoded
      error = true
      status = 400
      message = "Your query cannot have any special characters"
    end

    if !error
      error, results = MovieDb.search_by_query_for_all_pages(query, source="movie")
      message = "Oops no results could be found" if error
    end

    if !error && results.any?
      render json: { data: results }, status: status
    else
      render json: { error: true, message: message }, status: status
    end
  end


end
