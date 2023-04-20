require 'nokogiri'
require 'open-uri'
require_relative '../lib/cher_depute'


  # Vérifie que la méthode deputes_scraper renvoie un tableau de noms de ville non vide
describe 'deputes_scraper' do
  it 'returns a non-empty array of depute names' do
    deputes_data = deputes_scraper()
    expect(deputes_data).not_to be_empty
  end
end