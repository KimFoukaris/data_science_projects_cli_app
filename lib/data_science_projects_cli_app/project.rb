class DataScienceProjectsCliApp::Project

  attr_accessor :title, :project_url, :fellows, :mentor, :partner, :manager, :description, :description2

  @@all = []

  def initialize(project_hash)
    project_hash.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.make_projects
    @@all.clear
    projects_array = DataScienceProjectsCliApp::Scraper.scrape_projects_page
    projects_array.each {|project| self.new(project)}
    self.all
  end

  def self.add_project_details
    self.all.each do |project|
      project_details = DataScienceProjectsCliApp::Scraper.scrape_project_details_page(project.project_url)
      project_details.each {|key, value| project.send(("#{key}="), value)}
    end
    all
    end

  def self.all
    @@all
  end
end
