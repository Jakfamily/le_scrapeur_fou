require 'nokogiri'

require 'open-uri'

  

def deputes_scraper

 page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/deputes"))

 deputes_values = page.xpath('//*[@id="corps_page"]/div/div[2]/div[2]')

 # créer un hash vide pour stocker les données de deputer

 deputes_data = []

  

 # Itérer sur chaque ligne du tableau pour extraire les données

  deputes_values.each do |depute_value|

    deputes_name = depute_value.xpath('//span[@class="list_nom"]').text

    # ajouter les données des deputes au hash

    deputes_data << deputes_name

  end

 return deputes_data

end

  
  

# méthode pour iterer chaque ligne du hash afin de l'afficher sous forme de liste numérotée

def display_deputes_data_as_list(deputes_data)

  deputes_data.each_with_index do |depute_name|

    puts "#{depute_name}"

  end

end

  

# Appeler la fonction deputes_scraper pour récupérer le hash de toutes les données des députés

deputes_data = deputes_scraper()

  

# Afficher les données des députés sous forme de liste

display_deputes_data_as_list(deputes_data)

# require 'nokogiri'
# require 'open-uri'

# def deputes_scraper
#   page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/deputes"))
#   deputes_names = page.xpath('//*[@id="corps_page"]/div/div[2]/div[2]')

#   deputes_data = {}

#   # Itérer sur chaque ligne du tableau pour extraire les données
#   deputes_names.each do |depute_name|
#     deputes_data[depute_name.xpath('.//span[@class="list_nom"]').text] = ""
#   end 

#   return deputes_data
# end

# # méthode pour itérer chaque ligne du hash afin d'afficher les noms de députés sous forme de liste
# def display_deputes_data_as_list(deputes_data)
#   deputes_data.each do |depute_name, email|
#     puts depute_name
#   end
# end

# def emails_scraper(deputes_data)
#   deputes_data.each do |depute_name, email|
#     page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/depute/#{depute_name.downcase.gsub(' ', '-')}"))
#     emails_list = page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li[2]/a')
#     deputes_email = emails_list.text.strip
#     deputes_data[depute_name] = deputes_email
#   end
#   return deputes_data
# end

# deputes_data = deputes_scraper()
# deputes_data = emails_scraper(deputes_data)
# display_deputes_data_as_list(deputes_data)









