#!/usr/bin/ruby

require 'open-uri'
require 'nokogiri'

def bash_pl()
  bash = Nokogiri::HTML(open("http://bash.org.pl/random"))
  bash = bash.css("div[class='quote post-content post-body']").text

  bash = bash.gsub("\n","").gsub("\t","")
  if bash.include? "\r"
    bash = bash.split("\r")
    bash.each do |line|
      if !line.empty?
        puts line
      end
    end
  else
    bash = bash.split("<")
    bash.each do |line|
      if !line.empty?
        puts "<#{line}"
      end
    end
  end
end

arg = ARGV[0]

option = case arg
  when "bash_pl" then bash_pl
end
