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

  def self.scrape_project_details_page
    html = open("https://dssg.uchicago.edu/project/predictinglongtermunemploymentcascais/")
    project_details_doc = Nokogiri::HTML(html)
    project = {
      #:fellows => project_details_doc.css("span.project_attribute")[0],
      #:mentor => project_details_doc.css("span.project_attribute")[1],
      #:manager => project_details_doc.css("span.project_attribute")[2],
      #:partner => project_details_doc.css("span.project_attribute")[3],
      :description => project_details_doc.css("p").text
      }
  end

end
