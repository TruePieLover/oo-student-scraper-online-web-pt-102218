require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  
  
def self.scrape_index_page(index_url)
      emptyHashArray =[]
      open(index_url)
      doc = Nokogiri::HTML(open(index_url))   
      students = doc.css(".student-card").each do |student|
      name = student.css("h4").text
      location = student.css("p").text
      profile = student.css("a").attribute("href").value
      emptyHashArray << { :name => name, :location => location, :profile_url => profile }
      emptyHashArray
   end 
end

  def self.scrape_profile_page(profile_url)
      studentHashArray = {}
      student_url = Nokogiri::HTML(open(profile_url))
      medialink = student_url.css(".social-icon-container").children.css("a").map 
      do |x| x.attribute("href").value
      end
      medialink.each do |link|
       if link.include?("twitter")
           studentHashArray[:twitter] = link
       elsif link.include?("linkedin")
           studentHashArray[:linkedin] = link
       elsif link.include?("github")
           studentHashArray[:github] = link
       else
           studentHashArray[:blog] = link
       end
      end
       student[:profile_quote] = student_page.css(".profile-quote").text
       student[:bio] = student_page.css(".description-holder p").text
     studentHashArray
   end
 end
 
     
     
     