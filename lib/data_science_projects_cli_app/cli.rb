require 'pry'

class DataScienceProjectsCliApp::CLI

  def call
    list_projects
    choose_project
  end

  def list_projects
    puts "Data Science Projects for Good Include:"
    projects = DataScienceProjectsCliApp::Project.make_projects
    #puts projects
    #projects.each {|project| puts "#{project.name}"}

    #binding.pry

    #puts "1. xxx"
    #puts "2. yyy"

  end

  def choose_project
    project_details = DataScienceProjectsCliApp::Project.add_project_details

    input = nil
    while input != "exit"
      puts "Enter the number of the project you would like more information on:"
      #binding.pry
      input = gets.strip.to_i
      if input > 0 && input < project_details.length
        puts "#{project_details[input-1].description}"
      else
        puts "Please enter:  the number of the project, 'list', or 'exit'"
      end
    end
  end

  def exit
    puts "Thanks for your interest in data science projects for good."
  end

end
