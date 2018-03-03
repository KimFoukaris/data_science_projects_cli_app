require 'pry'

class DataScienceProjectsCliApp::CLI

  def call
    list_projects
    choose_project
  end

  def list_projects
    puts "Data Science Projects for Good Include:"
    projects = DataScienceProjectsCliApp::Project.make_projects
  end

  def choose_project
    project_details = DataScienceProjectsCliApp::Project.add_project_details

    input = nil
    until input == "exit"
      puts "If you would like more information on a project, enter the project number."
      puts "If you would like to see the list again, enter 'list'."
      puts "If you would like to exit, enter 'exit'."
      input = gets.strip
      project_num = input.to_i
      if project_num > 0 && project_num <= project_details.length
        puts "#{project_details[project_num-1].description}"
      elsif input == "list"
        list_projects
      elsif input == "exit"
        exit
      end
    end
  end

  def exit
    puts "Thanks for your interest in data science projects for good."
  end

end
