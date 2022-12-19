require 'nokogiri'
require 'httparty'
require 'byebug'
require 'json'

def scraper
  url = "https://www.worldometers.info/coronavirus/"
  unparsed_html = HTTParty.get(url)
  page = Nokogiri::HTML(unparsed_html)

  records = []
  total_countries = page.css("table#main_table_countries_today >tbody > tr >td> a.mt_a").map(&:text)
  

  byebug
end
scraper



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