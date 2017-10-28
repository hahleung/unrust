require 'nokogiri'
require 'pry'

file = File.read("old_doc.html")
old_html = Nokogiri::HTML(file)

binding.pry
html = old_html.to_html

File.write("new_doc.html", html)
