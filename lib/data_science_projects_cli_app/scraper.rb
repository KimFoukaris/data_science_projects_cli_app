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

  def self.scrape_project_details_page(project_page)
    html = open(project_page)
    project_details_doc = Nokogiri::HTML(html)
    project = {
      :fellows => project_details_doc.css("span.project_attribute")[0].next_sibling.text.strip,
      :mentor => project_details_doc.css("span.project_attribute")[1].next_sibling.text.strip,
      :partner => project_details_doc.css("span.project_attribute")[2].next_sibling.text.strip,
      :description => project_details_doc.css("p")[0].text,
      :description2 => project_details_doc.css("p")[1].text
      }
  end

end
