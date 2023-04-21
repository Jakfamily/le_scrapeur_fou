require 'nokogiri'
require 'open-uri'
require_relative '../lib/dark_trader'


#il s'attend à ce que `crypto_scraper` renvoie un tableau de 20 éléments.
describe '#crypto_scraper' do
  it 'scrapes the correct number of cryptocurrencies' do
    expect(crypto_scraper.length).to eq(20)
  end
#il s'attend à ce que `crypto_scraper['Bitcoin']` inclue le symbole "$".
  it 'scrapes the correct data for a specific cryptocurrency' do
    expect(crypto_scraper['Bitcoin']).to include('$')
  end
end

#il s'attend à ce que `display_crypto_data_as_list(crypto_data)` affiche une liste numérotée des éléments de `crypto_data`.

describe '#display_crypto_data_as_list' do
  let(:crypto_data) do
    {
      'Bitcoin' => '$61,430.31',
      'Ethereum' => '$2,437.13',
      'Binance Coin' => '$472.31'
    }
  end 

  it 'displays the data as a numbered list' do
    expect { display_crypto_data_as_list(crypto_data) }
      .to output("1. Bitcoin: $61,430.31\n2. Ethereum: $2,437.13\n3. Binance Coin: $472.31\n").to_stdout
  end
end