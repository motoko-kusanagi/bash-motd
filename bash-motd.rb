#!/usr/bin/ruby

require 'open-uri'
require 'nokogiri'

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

