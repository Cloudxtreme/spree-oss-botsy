require 'open-uri'
require 'nokogiri'

def insult(name)
  insult = Nokogiri.HTML(open('http://www.pangloss.com/seidel/Shaker/')).xpath("//font").first.content.strip.gsub('\n', ', ')
  "#{name}: #{insult}"
rescue
  [ "make love, not war", "no way, man", "chillax, dude", "relax", "peace out", "I'm a lover not a fighter" ].sample
end

desc 'botsy insult NAME', 'insult NAME in an erudite manner'
hear /\bbotsy[,;:\s]+insult\s+(.+)/ do |mdata|
  name = mdata[1].strip.split.map(&:capitalize).join(' ')
  @caller.insult(name)
end
