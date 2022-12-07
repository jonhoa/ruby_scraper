require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = "https://www.newchic.com/hoodies-c-12200/1.html?newhead=0&mg_id=2&from=nav&country=223&NA=1"
  unparsed_html = HTTParty.get(url)
  page = Nokogiri::HTML(unparsed_html)
  byebug 
end

scraper

