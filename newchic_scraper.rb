require 'nokogiri'
require 'httparty'
require 'byebug'
require 'json'

#EXPERIMENTING WITH COVID DATA
# def scraper
#   url = "https://www.worldometers.info/coronavirus/"
#   unparsed_html = HTTParty.get(url)
#   page = Nokogiri::HTML(unparsed_html)

#   records = []
#   total_countries = page.css("table#main_table_countries_today >tbody > tr >td> a.mt_a").map(&:text)
  

#   byebug
# end
# scraper



#EXPERIMENTING WITH PLANETARY DATA
# def scraper
#   url = "https://mdn.github.io/learning-area/html/tables/assessment-finished/planets-data.html"
#   unparsed_html = HTTParty.get(url)
#   page = Nokogiri::HTML(unparsed_html)

#   #arrange data into array
#   t_n = page.css("table> tbody> tr> th").map(&:text)

  
#   #planet names
#   t1 = t_n.reject{|element| element.to_s.include? " " }


#   byebug
# end
# scraper

#EXPERIMENTING WITH GLOBAL POWER STATISTICS
# def scraper
#   url = "https://www.worldometers.info/energy/"
#   unparsed_html = HTTParty.get(url)
#   page = Nokogiri::HTML(unparsed_html.body)

#   #Country
#   tc = page.css('table > tbody > tr >td > a').map(&:text)
  
#   #Energy Consumption
#   ec = page.xpath('//td[@style="font-weight: bold; text-align:right"]').map(&:text)
#   power = []
#   ec.each do |item|
#     if item.length > 9
#       power << item
#     end
#   end
#   byebug
# end
# scraper

#practice fetching data using this site https://www.worldometers.info/

#EXPERMINTING WITH POPULATION DATA
def scraper
  #Interface
  puts "========WEB SCRAPER 2.0 WORLD POPULATION==========="
  puts 
  puts "Shortcuts"
  puts "---------"
  puts " tp ==> Total Population"
  puts " tname ==> Country Names"
  puts " cpop ==> Country Names + Population"
  puts

  #Parsing data
  url = "https://www.worldometers.info/world-population/population-by-country/"
  unparsed_html = HTTParty.get(url)
  page = Nokogiri::HTML(unparsed_html.body)
  tp = []

  tc = page.css("table> tbody> tr> td").map(&:text)
  tname = page.css("table> tbody> tr> td> a").map(&:text)

  #extract population column with bold integers
  page.xpath('//td[@style="font-weight: bold;"]').each do |link|
    tp << link.content
  end
  str_arr = []
  
  #country and population
  cpop = []
  tname.zip(tp).each do |tname, tp|
    cpop << "#{tname} : #{tp}"
  end

  i = 0
  while i < 1
    #UI
    puts "Enter command"
    command = gets.chomp
    puts 
    #command logic
    if command == "tp"
      puts tp
      i += 1
    elsif command == "tname"
      puts tname
      i += 1
    elsif command == "cpop"
      puts cpop
      i += 1
    elsif command == "exit"
      exit
    else
      puts "! Wrong command !"
      puts "---------------"
    end
  end
 byebug
end
scraper

#select element td style = bold to capture population data
 #The code to do that is .xpath('//td[@style="font-weight: bold;"]')

 #make the app dynamic enough to extract data after inputing the url of any site