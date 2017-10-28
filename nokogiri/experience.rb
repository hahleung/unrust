require 'nokogiri'
require 'pry'

@doc = Nokogiri::HTML::DocumentFragment.parse <<-EOHTML
<body>
  <div id='michael'>Thriller <p>feaea</p></h1>
  <div id='jackson'>Beat it</h1>
  <div>Hola<div>
</body>
EOHTML

jackson = @doc.at_css("div[id='jackson']")
michael = @doc.at_css("div[id='michael']")

jackson.content = "OK"
binding.pry

puts @doc
