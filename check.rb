require 'pry'
require 'open-uri'
require 'nokogiri'

url_to_check = "http://loc.gov/appchallenge"
nodes = Nokogiri::HTML(open(url_to_check).read)
if nodes.css("h1.entry-title").text == "Innovate, Integrate, and Legislate: Announcing an App Challenge"
  title = "Waiting"
  msg = "Still Waiting"
else
  title = "Update"
  msg = "Something may be happening. At least the page has changed. Check out #{url_to_check} to see what's changed."
end
# Toggle notification on a Mac
cmd = %Q|osascript -e 'display notification \"#{msg}\" with title \"#{title}\"'|
system (cmd)
