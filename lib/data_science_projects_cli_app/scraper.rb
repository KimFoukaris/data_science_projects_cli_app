class DataScienceProjectsCliApp::Project

  def self.scrape_index_page
      html = open("https://dssg.uchicago.edu/projects/")
      projects_doc = Nokogiri::HTML(html)
      projects_array = []
      projects_doc.css("h3").each do |project|
        array << {
        :title => project.css("a").attribute("href").text,
        :project_url => project.css("a").attribute("href").value
        }
  end
    array
  end


end
