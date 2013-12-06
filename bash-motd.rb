#!/usr/bin/ruby

require 'open-uri'
require 'nokogiri'

def bash_pl()
  bash = Nokogiri::HTML(open("http://bash.org.pl/random"),'utf-8')
  bash = bash.css("div[class='quote post-content post-body']").text
  print(bash.gsub("\n","").gsub("\t",""))
end

def bash_org(count)
  bash = Nokogiri::HTML(open("http://bash.org/?random"),'utf-8')
  bash = bash.css("p[class='qt']")

  i = -1
  quote = []

  bash.each { |tag|
    quote[i+=1] = tag.text
    # print(quote[i].gsub("\n","").gsub("\t",""))
    puts
  }
  
  if count == "all"
    quote.each { |qt| 
      print(qt.gsub("\n","").gsub("\t",""))
      puts
    }
  else  
    print(quote[rand(i)].to_s.gsub("\n","").gsub("\t",""))
  end
end

def print(text)
  if text.include? "\r"
    text = text.split("\r")
    text.each do |line|
      if !line.empty?
        puts line
      end
    end
  else
    text = text.split("<")
    text.each do |line|
      if !line.empty?
        puts "<#{line}"
      end
    end
  end
end

def usage()
  puts "Usage: ./bash-motd.rb {bash_pl|bash_org}"
end

arg = ARGV[0]

option = case arg
  when "bash_pl" then bash_pl
  when "bash_org" then bash_org("all")
  when "bash_org_one" then bash_org("one")
  else usage
end
