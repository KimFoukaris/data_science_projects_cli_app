class DataScienceProjectsCliApp::CLI

  def call
    list_projects
    choose_project
  end

  def list_projects
    projects_array = DataScienceProjectsCliApp::Project.new.make_projects

    puts "Data Science Projects for Good Include:"
    puts "1. xxx"
    puts "2. yyy"
  end

  def choose_project
    input = nil
    while input != "exit"
      puts "Enter the number of project you would like more information on:"
      input = gets.strip
      case input
      when "1"
        puts "Project 1 info"
      when "2"
        puts "Project 2 info"
      when "exit"
        exit
      when "list"
        list_projects
      else
        puts "Please enter:  the number of the project, 'list', or 'exit'"
      end
    end
  end

  def exit
    puts "Thanks for your interest in data science projects for good."
  end

end
