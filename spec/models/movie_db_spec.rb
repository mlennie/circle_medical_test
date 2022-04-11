RSpec.describe 'MovieDb' do
  context 'with correct params' do
    it 'return correctly formatted results' do
      results = MovieDb.search_by_query_for_all_pages("batman")
      expect { results.length }.to equal(20)
      expected_first_results = {
        id: 414906,
        url: "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
        title: "The Batman",
        overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler."
      }
      binding.pry
      expect {results[0][:id]}.to equal(414906)
    end
  end
end
