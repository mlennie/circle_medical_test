RSpec.describe MovieDbController do
    describe "GET results by query" do
    it "returns 200 status" do
      get :search_by_query
      expect(response).to have_https_status(200)
    end
  end
end
