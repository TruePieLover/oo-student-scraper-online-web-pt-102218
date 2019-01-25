require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  
  
def self.scrape_index_page(index_url)
    studentHash = []
    index_page = Nokogiri::HTML(open(index_url))
    index_page.css("div.roster-cards-container").each do |x|
    x.css(".student-card a").each do |student|
         student_profile_link = "#{student.attr('href')}"
         student_location = student.css('.student-location').text
         student_name = student.css('.student-name').text
         studentHash << {name: student_name, location: student_location, profile_url: student_profile_link}
       end
     end
     studentHash
   end	   

<<<<<<< HEAD
def self.scrape_profile_page(profile_url)
    studentHash = {}
    html = Nokogiri::HTML(open(profile_url))
    social_links =html.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
    social_links.each do |link|
    if link.include?("twitter")
        studentHash[:twitter] = link
    elsif link.include?("linkedin")
        studentHash[:linkedin] = link
    elsif link.include?("github")
        studentHash[:github] = link
    elsif link.include?(".com")
        studentHash[:blog] = link
         end
       end
    studentHash[:profile_quote] = html.css(".profile-quote").text
    studentHash[:bio] = html.css("div.description-holder p").text
    studentHash
  end
end
=======
  def self.scrape_profile_page(profile_url)
      profile_page = Nokogiri::HTML(open(profile_url))
      profile_url = {}
      profile_page.css(".social-icon-container a").each do |social|
      if social.attribute("href").value.include? ("twitter") 
        profile_url[:twitter] = social.attribute("href").value 
      elsif social.attribute("href").value.include?("linkedin") 
          profile_url[:linkedin] = social.attribute("href").value 
      elsif social.attribute("href").value.include? ("github") 
           profile_url[:github] = social.attribute("href").value 
      else 
          profile_url[:blog] = social.attribute("href").value 
        end
      profile_url
    end

 

     
     
>>>>>>> 9a9f01b8cccc71be88ad4f1c6a29da1f1ab52fcf
