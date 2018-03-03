require 'pry'

class DataScienceProjectsCliApp::Project

  attr_accessor :title, :project_url, :fellows, :mentor, :partner, :manager, :description

  @@all = []

  def initialize(project_hash)
    project_hash.each {|key,value| self.send(("#{key}="), value)}

    #student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def test
    puts "testing"
  end

  def self.make_projects
    projects_array = DataScienceProjectsCliApp::Scraper.scrape_projects_page
    projects_array.each {|project| DataScienceProjectsCliApp::Project.new(project)}
    @@all.each {|project| puts "#{@@all.index(project)+1}. #{project.title}"}
    #binding.pry
    #students_array.each {|student| Student.new(student)}
  end

  def self.add_project_details
    project_details = DataScienceProjectsCliApp::Scraper.scrape_project_details_page
    #puts project_details
  end

  def self.all
    @@all
  end
end
