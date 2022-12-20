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

#practice fetching data using this site https://www.worldometers.info/

#EXPERMINTING WITH POPULATION DATA
def scraper
  url = "https://www.worldometers.info/world-population/population-by-country/"
  unparsed_html = HTTParty.get(url)
  page = Nokogiri::HTML(unparsed_html)

  tc = page.css("table> tbody> tr> td").map(&:text)
  tname = page.css("table> tbody> tr> td> a").map(&:text)

  str_arr = []

  tc.each do |item|
    if item.match(/[a-zA-Z]/)
    str_arr << item
  end
end
  [str_arr.join(" ")]
  byebug
end
scraper