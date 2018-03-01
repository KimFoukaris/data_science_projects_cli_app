class DataScienceProjectsCliApp::Project

  attr_accessor :title, :url, :fellows, :mentor, :partner, :description

  @@all = []

  def initialize(project_hash)
    project_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(projects_array)
    projects_array.each {|project| Project.new(project)}
  end

  def add_project_details(details_hash)
    details_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.all
    @@all
  end
end
