class DataScienceProjectsCliApp::Project

  attr_accessor :title, :url, :fellows, :mentor, :partner, :description

  @@all = []

  def initialize
    @@all << self
  end

  def test
    puts "testing"
  end

  def make_projects
    projects_array = DataScienceProjectsCliApp::Scraper.scrape_projects_page
    puts projects_array
  end

  def add_project_details

  end

  def self.all
    @@all
  end
end
