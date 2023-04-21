require 'nokogiri'
require 'open-uri'
require_relative '../lib/mairie_christmas'


  # Vérifie que la méthode city_scraper renvoie un tableau de noms de ville non vide
describe 'city_scraper' do
  it 'returns a non-empty array of city names' do
    city_data = city_scraper()
    expect(city_data).not_to be_empty
  end
end

# Vérifie que la méthode emails_scraper met à jour le hash city_data avec les adresses email de chaque ville
describe "emails_scraper" do
  it "updates the city_data hash with the email addresses for each city" do
    city_data = {"ableiges" => "", "aincourt" => ""}
    updated_city_data = emails_scraper(city_data)
    expect(updated_city_data).to be_a(Hash)
    expect(updated_city_data["ableiges"]).to eq("mairie.ableiges95@wanadoo.fr")
    expect(updated_city_data["aincourt"]).to eq("mairie.aincourt@wanadoo.fr")
  end
end

 # Vérifie que la méthode display_city_data_as_list affiche les données de chaque ville dans une liste numérotée
describe "display_city_data_as_list" do
  it "displays the city data in a numbered list" do
    city_data = {"ableiges" => "mairie.ableiges95@wanadoo.fr", "aincourt" => "mairie.aincourt@wanadoo.fr"}
    expect { display_city_data_as_list(city_data) }.to output("1. ableiges: mairie.ableiges95@wanadoo.fr\n2. aincourt: mairie.aincourt@wanadoo.fr\n").to_stdout
  end
end