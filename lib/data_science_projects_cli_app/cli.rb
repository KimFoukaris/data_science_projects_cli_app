class DataScienceProjectsCliApp::CLI

  def call
    list_projects
    choose_project
  end

  def list_projects
    puts " "
    puts "Data Science Projects for Good Include:"
    puts "+++++++++++++++++++++++++++++++++++++++"
    puts " "
    projects = DataScienceProjectsCliApp::Project.make_projects
  end

  def choose_project
    project_details = DataScienceProjectsCliApp::Project.add_project_details

    input = nil
    until input == "exit"
      selector
      input = gets.strip
      project_num = input.to_i
      if project_num > 0 && project_num <= project_details.length
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++++"
        puts " "
        puts "#{project_details[project_num-1].title.upcase}"
        puts " "
        project_details[project_num-1].fellows = project_details[project_num-1].fellows.delete ":"
        project_details[project_num-1].mentor = project_details[project_num-1].mentor.delete ":"
        project_details[project_num-1].partner = project_details[project_num-1].partner.delete ":"
        puts "Fellows:  #{project_details[project_num-1].fellows.strip}"
        puts "Mentor:  #{project_details[project_num-1].mentor.strip}"
        puts "Partner:  #{project_details[project_num-1].partner.strip}"
        puts " "
        puts "Description:  #{project_details[project_num-1].description}"
        puts " "
        puts "#{project_details[project_num-1].description2}"
        puts " "
      elsif input == "list"
        list_projects
      elsif input == "exit"
        exit
      end
    end
  end

  def selector
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts " "
    puts "If you would like more information on a project, enter the project number."
    puts "If you would like to see the list again, enter 'list'."
    puts "If you would like to exit, enter 'exit'."
  end

  def exit
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "Thanks for your interest in data science projects for good."
    puts " "
  end

end
