# require libraries/modules here
require 'nokogiri'
require 'pry'

# html = File.read('fixtures/kickstarter.html')

# kickstarter = Nokogiri::HTML(html)

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("divproject-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta span.location-name").text
# percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i


# Var = _    will set 'Var' to previous return value

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  # Iterate through the projects
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text, 
      :percent_funded => project.css("ul.projects-stats li.first.funded strong").text.gsub("%", "").to_i
    }
    # binding.pry
  end

  # return the projects hash
  projects
end

create_project_hash
