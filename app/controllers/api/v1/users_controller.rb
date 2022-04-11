class Api::V1::UsersController < Api::V1::ApiApplicationController

  def get_current_user
    render json: {data: "hello"}, status: 200
  end

end
