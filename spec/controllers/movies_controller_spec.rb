require "rails_helper"

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe "GET results by query" do

    context "no query sent" do
      it "returns 400 status and correct error message" do
        get :search_by_query
        expect(response.status).to eq(400)
        body = JSON.parse(response.body)
        expect(body["error"]).to eq(true)
        expect(body["message"]).to eq("You must enter query text")
      end
    end

    context "with query" do
      it "returns 200 status and correct data" do
        get :search_by_query, params: { query: "batman" }
        expect(response.status).to eq(200)
        body = JSON.parse(response.body)
        data = body["data"]
        expect(data.length).to eq(20)
        expect(data[0]["id"]).to equal(414906)
        expect(data[0]["url"]).to eq("https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg")
        expect(data[0]["title"]).to eq("The Batman")
        expect(data[0]["overview"]).to eq("In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.")

      end
    end

  end
end
