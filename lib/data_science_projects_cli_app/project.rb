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

  end

  def add_project_details

  end

  def self.all
    @@all
  end
end
