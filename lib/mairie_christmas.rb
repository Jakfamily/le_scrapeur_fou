require 'nokogiri'
require 'open-uri'

def city_scraper
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  city_names = page.xpath('//td/p/a[@class="lientxt"]')

  city_data = {}

  city_names.each do |city_name|
    city_data[city_name.text.tr(" ", "-")] = ""
  end 

  return city_data
end

def display_city_data_as_list(city_data)
  city_data.each_with_index do |(city_name, email), index|
    puts "#{index + 1}. #{city_name}: #{email}"
  end
end

def emails_scraper(city_data)
  city_data.each do |city_name, email|
    page = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/95/#{city_name.downcase}.html"))
    emails_list = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    city_email = emails_list.text.strip
    city_data[city_name] = city_email
  end
  return city_data
end

city_data = city_scraper()
city_data = emails_scraper(city_data)
display_city_data_as_list(city_data)




