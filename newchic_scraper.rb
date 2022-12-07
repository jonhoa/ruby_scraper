require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = "https://www.worldometers.info/coronavirus/"
  unparsed_html = HTTParty.get(url)
  page = Nokogiri::HTML(unparsed_html)
  total_countries = page.css('table#main_table_countries_today > tbody > tr').map(&:text).count
  byebug
end

scraper

