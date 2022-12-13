require 'nokogiri'
require 'httparty'
require 'byebug'
require 'json'

# def scraper
#   url = "https://www.worldometers.info/coronavirus/"
#   unparsed_html = HTTParty.get(url)
#   page = Nokogiri::HTML(unparsed_html)

#   records = []
#   total_countries = page.css("table#main_table_countries_today > tbody > tr").map(&:text).count

#   byebug
# end
# scraper

#   i = 1
#   while i < total_countries
#     record = page.css("table#main_table_countries_today > tbody > tr[#{i}]").text
#     record = record.split("\n")
    
#     record_hash ={
#       "name": record[1],
#       "total_cases": record[2],
#       "new_cases": record[3],
#       "total_deaths": record[4],
#       "new_deaths": record[5],
#       "total_recovered": record[6],
#       "active_cases": record[7],
#       "first_case": record[8]
#     }
#     records << record_hash
#     i +=1
#   end
#   records
#   byebug
# end

# scraper

#counts over 240 countries instead of 220
# try sample data from this site https://mdn.github.io/learning-area/html/tables/assessment-finished/planets-data.html

def scraper
  url = "https://mdn.github.io/learning-area/html/tables/assessment-finished/planets-data.html"
  unparsed_html = HTTParty.get(url)
  page = Nokogiri::HTML(unparsed_html)

  #arrange data into array
  total_names = page.css("th").map(&:text)
  # total_names.map {|element| element ["row"]}
  
  #planet
  i = 11
  while i < 19
  puts total_names[i]
  i +=1
  end

  byebug
end

scraper


#Nokogiri
  #.text - prints text files generated in unparshed html

#semi got it working. puts names of planets with other random data


