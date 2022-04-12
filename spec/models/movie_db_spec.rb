class StubItems
  def parsed_response
    return nil
  end
end

RSpec.describe 'MovieDb' do
  context 'network request mocked' do
    it 'return correctly formatted results' do

      stub = StubItems.new
      expected_results = {
        page: 1,
        results: [
          {
            id: 414906,
            poster_path: "/74xTEgt7R36Fpooo50r9T25onhq.jpg",
            title: "The Batman",
            overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler."
          }
        ]
      }

      # mock and stub movie db request
      allow(HTTParty).to receive(:get).and_return(stub)
      allow(stub).to receive(:parsed_response).and_return(expected_results)
      results = MovieDb.search_by_query_for_all_pages("batman")[1]

      expect(results.length).to equal(1)
      expect(results[0][:id]).to equal(414906)
      expect(results[0][:url]).to eq("https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg")
      expect(results[0][:title]).to eq("The Batman")
      expect(results[0][:overview]).to eq("In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.")
    end
  end

  context 'network request not mocked' do
    it 'return correctly formatted results' do

      results = MovieDb.search_by_query_for_all_pages("batman")[1]

      expect(results.length).to equal(20)
      expect(results[0][:id]).to equal(414906)
      expect(results[0][:url]).to eq("https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg")
      expect(results[0][:title]).to eq("The Batman")
      expect(results[0][:overview]).to eq("In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.")
    end
  end

end
