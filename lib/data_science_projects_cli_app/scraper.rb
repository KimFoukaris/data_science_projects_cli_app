require 'nokogiri'
require 'open-uri'
require 'pry'

class DataScienceProjectsCliApp::Scraper

  def self.scrape_projects_page
      html = open("https://dssg.uchicago.edu/projects/")
      projects_doc = Nokogiri::HTML(html)
      projects_array = []
      projects_doc.css("h3").each do |project|
        projects_array << {
        :title => project.css("a").text,
        :project_url => project.css("a").attribute("href").value
        }
  end
    projects_array
  end


end
