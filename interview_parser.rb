#!/usr/bin/env ruby

class Parser
  def clean(file_path)
    file = File.read(file_path).split(" ")
    original_file = file[1..-1]
    clean_file = original_file
                   .delete_if { |w| w.to_s.start_with?('NOTE') }
                   .delete_if { |w| w.to_s.start_with?('duration') }
                   .delete_if { |w| w.to_s.start_with?('Confidence') }
                   .delete_if { |w| w.to_s.start_with?('language') }
                   .delete_if { |w| w.to_s.start_with?('0') }
                   .delete_if { |w| w.to_s.start_with?('-->') }
                   .delete_if { |w| w.to_s.include?('-') }
                   .join(" ")
    p clean_file
    File.write(file_path, clean_file)
  end
end

parser = Parser.new
puts "Give me a file path"
file_path = gets.chomp
parser.clean(file_path)
